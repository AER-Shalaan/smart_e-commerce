import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class WideArrowButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final String routeName;

  const WideArrowButton({super.key,
    required this.imagePath,
    required this.label,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
         children: [
           SvgPicture.asset(
             imagePath,
              height: 24,
             colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
           ),
           const SizedBox(
             width: 16,
           ),
           Text(label, style:TextStyles.accountLabels),
           const Spacer(),
            const Icon(
             color: AppColors.primary,
             Icons.arrow_forward_ios_sharp,
             size: 24,
           )
         ],
        ),
      ),
    );
  }
}
