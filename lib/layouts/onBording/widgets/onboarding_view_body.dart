import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/routes.dart';
import 'onboarding_login_button.dart';
import 'onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnboardingLoginButton(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.loginViewRouteName,
                );
              },
              isLogin: true,
            ),
            const SizedBox(width: 20),
            OnboardingLoginButton(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.signUpViewRouteName,
                );
              },
              isLogin: false,
            ),
          ],
        ),
        const SizedBox(height: 57),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Visibility(
              visible: currentPage != 0,
              child: ElevatedButton(
                onPressed:
                    currentPage == 0
                        ? null
                        : () {
                          pageController.animateToPage(
                            currentPage - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.all(16),
                  overlayColor: Colors.white.withAlpha(102),
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: MediaQuery.sizeOf(context).width * 0.05,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DotsIndicator(
                dotsCount: 3,
                position: currentPage.toDouble(),
                decorator: DotsDecorator(
                  activeColor: Theme.of(context).colorScheme.primary,
                  activeShape: const CircleBorder(),
                  color: Theme.of(context).colorScheme.primary.withAlpha(102),
                  shape: const CircleBorder(),
                  activeSize: const Size(9, 9),
                  size: const Size(9, 9),
                ),
              ),
            ),
            Visibility(
              visible: currentPage != 2,
              child: ElevatedButton(
                onPressed: () {
                  pageController.animateToPage(
                    currentPage + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.all(16),
                  overlayColor: Colors.white.withAlpha(102),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: MediaQuery.sizeOf(context).width * 0.05,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
