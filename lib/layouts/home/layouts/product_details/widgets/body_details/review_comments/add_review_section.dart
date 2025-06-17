import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/check_review_view_model/check_review_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/check_review_view_model/check_review_state.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_review_view_model/add_review_view_model.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/add_review_view_model/add_review_states.dart';

class AddReviewSection extends StatefulWidget {
  final String token;
  final String itemId;
  final String buyerId;
  final VoidCallback? onReviewAdded;

  const AddReviewSection({
    super.key,
    required this.token,
    required this.itemId,
    required this.buyerId,
    this.onReviewAdded,
  });

  @override
  State<AddReviewSection> createState() => _AddReviewSectionState();
}

class _AddReviewSectionState extends State<AddReviewSection> {
  final TextEditingController _controller = TextEditingController();
  int _rating = 0;
  bool _waitingAI = false;
  bool _waitingAdd = false;

  void _onSubmit() {
    final text = _controller.text.trim();
    if (text.isEmpty || _rating == 0) {
      AppSnackBar.show(
        context: context,
        message: "Please write a review and select a rating first.",
        icon: Icons.info,
        backgroundColor: Colors.orange,
      );
      return;
    }
    setState(() => _waitingAI = true);
    context.read<CheckReviewViewModel>().getAICheckData(text: text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<CheckReviewViewModel, CheckReviewState>(
          listener: (context, state) {
            if (state is CheckReviewLoadingState) {
              setState(() => _waitingAI = true);
            } else if (state is CheckReviewErrorState) {
              setState(() => _waitingAI = false);
              AppSnackBar.show(
                context: context,
                message: state.failure.message,
              );
            } else if (state is CheckReviewSuccessState) {
              setState(() => _waitingAI = false);
              if (state.aiCheckModel.isClean == true) {
                // Review is clean, submit
                setState(() => _waitingAdd = true);
                context.read<AddReviewViewModel>().addReview(
                  token: widget.token,
                  itemID: widget.itemId,
                  buyerID: widget.buyerId,
                  rating: _rating,
                  comment: _controller.text.trim(),
                );
              } else {
                AppSnackBar.show(
                  context: context,
                  message:
                      state.aiCheckModel.message ??
                      "Your review contains inappropriate words.",
                  icon: Icons.warning_amber_rounded,
                  backgroundColor: Colors.red,
                );
              }
            }
          },
        ),
        BlocListener<AddReviewViewModel, AddReviewStates>(
          listener: (context, state) {
            if (state is AddReviewLoadingState) {
              setState(() => _waitingAdd = true);
            } else if (state is AddReviewErrorState) {
              setState(() => _waitingAdd = false);
              AppSnackBar.show(
                context: context,
                message: state.failure.message,
                icon: Icons.error,
                backgroundColor: Colors.red,
              );
            } else if (state is AddReviewSuccessState) {
              setState(() => _waitingAdd = false);
              AppSnackBar.show(
                context: context,
                message: "Review added successfully.",
                icon: Icons.check_circle,
                backgroundColor: Colors.green,
              );
              _controller.clear();
              setState(() => _rating = 0);
              if (widget.onReviewAdded != null) {
                widget.onReviewAdded!();
              }
            }
          },
        ),
      ],
      child: Center(
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          color: theme.cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add a Review",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 14),
                // Rating stars
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final selected = index < _rating;
                    return IconButton(
                      splashRadius: 22,
                      icon: Icon(
                        selected
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        color: selected ? Colors.amber : Colors.grey[400],
                        size: 32,
                      ),
                      onPressed:
                          _waitingAI || _waitingAdd
                              ? null
                              : () => setState(() => _rating = index + 1),
                    );
                  }),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _controller,
                  enabled: !_waitingAI && !_waitingAdd,
                  minLines: 2,
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Write your review...",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _waitingAI || _waitingAdd ? null : _onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                    ),
                    child:
                        _waitingAI || _waitingAdd
                            ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.3,
                                color: Colors.white,
                              ),
                            )
                            : Text(
                              "Submit Review",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
