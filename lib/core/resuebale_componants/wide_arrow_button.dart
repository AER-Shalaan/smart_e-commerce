import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WideArrowButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final String routeName;

  const WideArrowButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              colorFilter: ColorFilter.mode(
                theme.colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: theme.textTheme.bodyLarge,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 24,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
