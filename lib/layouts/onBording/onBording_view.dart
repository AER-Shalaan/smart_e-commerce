import 'package:flutter/material.dart';
import 'package:smart_ecommerce/layouts/onBording/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnboardingViewBody()));
  }
}
