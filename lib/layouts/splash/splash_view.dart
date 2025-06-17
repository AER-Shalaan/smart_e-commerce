import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/config/auth_session.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/routes.dart';
import '../../config/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        final navigator = Navigator.of(context);
        final hasSeenOnboarding =
            await SharedPreferencesFunctions.hasSeenOnBoarding();
        final session = await AuthSession.getSession();
        if (!hasSeenOnboarding) {
          await SharedPreferencesFunctions.setOnBoardingSeen();
          navigator.pushReplacementNamed(Routes.onBoardingRouteName);
        } else if (session != null) {
          navigator.pushReplacementNamed(Routes.homeView);
        } else {
          await AuthSession.clear();
          navigator.pushReplacementNamed(Routes.loginViewRouteName);
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: SizedBox(
                      height: height * 0.2,
                      child: SvgPicture.asset(
                        Assets.assetsImagesSplashLamp,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Inspire Shopping",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 15,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                          backgroundColor: theme.colorScheme.surface,
                          value: _progressAnimation.value,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.assetsImagesSplashGirl,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }
}
