import 'package:flutter/material.dart';

import '../../../../../../../core/resuebale_componants/custom_main_button.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/text_styles.dart';
class MyDetailsBody extends StatelessWidget {
  const MyDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem(context, "Full Name", "AbdEl-Rahamn Shalaan",
                Icons.person_outline, () {
              // Api
            }),
            _buildDetailItem(context, "Email Address",
                "abdelrahman.shalaan03@gmail.com", Icons.email_outlined, () {
              // Api
            }),
            _buildDetailItem(
                context, "Date of Birth", "01/06/2003", Icons.calendar_today,
                () {
              // Api
            }),
            // _buildDetailItem(context, "Gender", "Male", Icons.male, () {
            //   // Api
            // }),
            _buildDetailItem(context, "Phone Number", "+20 155 929 6111",
                Icons.call_outlined, () {
              // Api
            }),
            const Spacer(),
            const CustomMainButton(
              label: "Submit",
              isDisabled: true,
              width: double.infinity,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String title, String value,
      IconData icon, void Function() onEdit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.myDetailsLabels),
          const SizedBox(height: 4),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColors.secondary.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: AppColors.secondary.withOpacity(0.5)),
                    const SizedBox(width: 5),
                    Expanded(
                        child: Text(value, style: TextStyles.myDetailsTexts)),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit_square,
                      color: AppColors.secondary.withOpacity(0.7)))
            ],
          ),
        ],
      ),
    );
  }
}
