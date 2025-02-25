import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.mainAxisAlignment,
  });
  final String imagePath;
  final String title;
  final String description;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Expanded(
          flex: 10,
          child: AspectRatio(
            aspectRatio: 2,
            child: FittedBox(
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: TextAnimator(
            title,
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w700),
            incomingEffect: WidgetTransitionEffects.incomingScaleUp(
                curve: Curves.bounceIn,
                duration: const Duration(milliseconds: 100)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextAnimator(
              description,
              style: GoogleFonts.openSans(
                  fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              incomingEffect: WidgetTransitionEffects.incomingScaleUp(
                  curve: Curves.bounceIn,
                  duration: const Duration(milliseconds: 10)),
            ),
          ),
        ),
      ],
    );
  }
}
