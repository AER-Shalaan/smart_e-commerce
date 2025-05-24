import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          enableFeedback: false,
          overlayColor: Colors.white.withAlpha(102),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor:
              isLogin
                  ? const Color(0xff292C32)
                  : Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          isLogin ? "Login" : "Sign Up",
          style: GoogleFonts.arima(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
