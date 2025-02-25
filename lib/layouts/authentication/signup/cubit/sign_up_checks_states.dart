import 'package:equatable/equatable.dart';

class SignUpChecksState extends Equatable {
  final bool isFNCheck;
  final bool isLNCheck;
  final bool isEmailCheck;
  final bool isPassCheck;
  final bool isConfirmPassCheck;
  final bool isWrongFirstName;
  final bool isWrongLastName;
  final bool isWrongEmail;
  final bool isWrongPass;
  final bool isWrongConfirmPass;
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;

  const SignUpChecksState({
    required this.isFNCheck,
    required this.isLNCheck,
    required this.isEmailCheck,
    required this.isPassCheck,
    required this.isConfirmPassCheck,
    required this.isWrongFirstName,
    required this.isWrongLastName,
    required this.isWrongEmail,
    required this.isWrongPass,
    required this.isWrongConfirmPass,
    required this.isPasswordObscure,
    required this.isConfirmPasswordObscure,
  });

  SignUpChecksState copyWith({
    bool? isFNCheck,
    bool? isLNCheck,
    bool? isEmailCheck,
    bool? isPassCheck,
    bool? isConfirmPassCheck,
    bool? isWrongFirstName,
    bool? isWrongLastName,
    bool? isWrongEmail,
    bool? isWrongPass,
    bool? isWrongConfirmPass,
    bool? isPasswordObscure,
    bool? isConfirmPasswordObscure,
  }) {
    return SignUpChecksState(
      isFNCheck: isFNCheck ?? this.isFNCheck,
      isLNCheck: isLNCheck ?? this.isLNCheck,
      isEmailCheck: isEmailCheck ?? this.isEmailCheck,
      isPassCheck: isPassCheck ?? this.isPassCheck,
      isConfirmPassCheck: isConfirmPassCheck ?? this.isConfirmPassCheck,
      isWrongFirstName: isWrongFirstName ?? this.isWrongFirstName,
      isWrongLastName: isWrongLastName ?? this.isWrongLastName,
      isWrongEmail: isWrongEmail ?? this.isWrongEmail,
      isWrongPass: isWrongPass ?? this.isWrongPass,
      isWrongConfirmPass: isWrongConfirmPass ?? this.isWrongConfirmPass,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isConfirmPasswordObscure:
          isConfirmPasswordObscure ?? this.isConfirmPasswordObscure,
    );
  }

  @override
  List<Object> get props => [
    isFNCheck,
    isLNCheck,
    isEmailCheck,
    isPassCheck,
    isConfirmPassCheck,
    isWrongFirstName,
    isWrongLastName,
    isWrongEmail,
    isWrongPass,
    isWrongConfirmPass,
    isPasswordObscure,
    isConfirmPasswordObscure,
  ];
}

final class InitialSignUpChecksState extends SignUpChecksState {
  const InitialSignUpChecksState()
    : super(
        isFNCheck: false,
        isLNCheck: false,
        isConfirmPassCheck: false,
        isEmailCheck: false,
        isPassCheck: false,
        isWrongFirstName: false,
        isWrongLastName: false,
        isWrongEmail: false,
        isWrongPass: false,
        isWrongConfirmPass: false,
        isConfirmPasswordObscure: true,
        isPasswordObscure: true,
      );
}
