import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_ecommerce/core/constants.dart';
import 'package:smart_ecommerce/core/resuebale_componants/item_widget/view_model/add_item_view_view_model.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/core/utils/routes.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
    required this.product,
    required this.token,
    required this.userId,
  });

  final ProductDetailsModel product;
  final String token;
  final String userId;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  double _scale = 1.0;
  double _elevation = 2;

  void _onTapDown(_) {
    setState(() {
      _scale = 0.97;
      _elevation = 8;
    });
    HapticFeedback.lightImpact();
  }

  void _onTapUp(_) {
    setState(() {
      _scale = 1.0;
      _elevation = 2;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
      _elevation = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      child: Material(
        elevation: _elevation,
        borderRadius: BorderRadius.circular(15),
        shadowColor: Colors.black.withAlpha(
          theme.brightness == Brightness.dark ? 80 : 25,
        ),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            BlocProvider.of<AddItemViewViewModel>(context).addItemView(
              token: widget.token,
              userId: int.parse(widget.userId),
              itemId: widget.product.data!.itemID!,
            );
            Navigator.pushNamed(
              context,
              Routes.productDetailsView,
              arguments: [
                widget.product.data!.itemID,
                widget.token,
                widget.userId,
              ],
            );
          },
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          splashColor: colorScheme.primary.withAlpha(25),
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: width >= 600 ? 280 : 240,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: theme.dividerColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      "${Constants.baseUrl}${widget.product.data!.imageCover}",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return FadeIn(child: child);
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: colorScheme.secondary,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: theme.disabledColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.data!.itemName ?? "",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if ((widget.product.data!.discount ?? 0) != 0)
                                Text(
                                  "\$${(widget.product.data!.priceOut ?? 0).toStringAsFixed(2)}",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${((widget.product.data!.priceOut ?? 0) - (widget.product.data!.discount ?? 0)).toStringAsFixed(2)}",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.textTheme.bodyLarge?.color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          if ((widget.product.data!.discount ?? 0) != 0)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "-\$${(widget.product.data!.discount ?? 0).toStringAsFixed(2)}",
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.assetsIconsStarIcon,
                            width: 18,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFFFC107),
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.product.rating?.averageRating != null
                                ? widget.product.rating!.averageRating!
                                    .toStringAsFixed(2)
                                : "0.00",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "(${widget.product.rating!.totalReviews} Reviews)",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
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
