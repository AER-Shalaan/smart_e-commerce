import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/utils/app_colors.dart';

class PinInputForm extends StatelessWidget {
  final TextEditingController controller;
  const PinInputForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        length: 6,
        controller: controller,
        pinAnimationType: PinAnimationType.fade,
        defaultPinTheme: PinTheme(
          height: 64,
          width: 60,
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withAlpha(102),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(25),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
        focusedPinTheme: PinTheme(
          height: 64,
          width: 60,
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
        errorPinTheme: PinTheme(
          height: 64,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withAlpha(102),
          ),
        ),
        onCompleted: (pin) {

        },
      ),
    );
  }
}
