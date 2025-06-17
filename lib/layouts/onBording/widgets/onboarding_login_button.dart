import 'package:flutter/material.dart';

class OnboardingLoginButton extends StatelessWidget {
  const OnboardingLoginButton({
    super.key,
    required this.onTap,
    required this.isLogin,
  });
  final Function() onTap;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = isLogin
        ? theme.colorScheme.secondary
        : theme.colorScheme.primary;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          enableFeedback: false,
          overlayColor: theme.colorScheme.onPrimary.withAlpha(102),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: buttonColor,
        ),
        child: Text(
          isLogin ? "Login" : "Sign Up",
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onPrimary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
