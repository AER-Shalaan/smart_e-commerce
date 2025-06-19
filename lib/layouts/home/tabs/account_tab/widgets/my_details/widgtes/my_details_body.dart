import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_details/view_model/profile_view_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_details/view_model/profile_view_model_state.dart';
import '../../../../../../../core/resuebale_componants/custom_main_button.dart';

class MyDetailsBody extends StatelessWidget {
  const MyDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileViewModel, ProfileViewModelState>(
        builder: (context, state) {
          if (state is ProfileViewModelSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Center(
                    child: CircleAvatar(
                        radius: 80,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(Assets.assetsImagesManAvatar))),
                  ),
                  _buildDetailItem(
                    context,
                    state.profileModel.userProfile?.buyerName ?? "",
                    Icons.person_outline,
                    () {
                      // Api
                    },
                  ),
                  _buildDetailItem(
                    context,
                    state.profileModel.userProfile?.email ?? "",
                    Icons.email_outlined,
                    () {
                      // Api
                    },
                  ),
                  _buildDetailItem(
                    context,
                    state.profileModel.userProfile?.phone ?? "",
                    Icons.phone,
                    () {
                      // Api
                    },
                  ),
                  const Spacer(),
                  const CustomMainButton(
                    label: "Submit",
                    isDisabled: true,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          }
          if (state is ProfileViewModelError) {
            return Center(child: Text(state.failure.message.toString()));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildDetailItem(
    BuildContext context,
    String title,
    // String value,
    IconData icon,
    void Function() onEdit,
  ) {
    final theme = Theme.of(context);
    return TextFormField(
        decoration: InputDecoration(
      prefixIcon: Icon(icon),
      enabled: false,
      labelText: title,
      suffixIcon: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: onEdit,
      ),
    ));
  }
}
