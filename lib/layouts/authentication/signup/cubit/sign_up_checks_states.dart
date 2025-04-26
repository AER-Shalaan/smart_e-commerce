import 'package:equatable/equatable.dart';

class SignUpChecksState extends Equatable {
  final bool isFNCheck;
  final bool isLNCheck;
  final bool isEmailCheck;
  final bool isPhoneCheck;
  final bool isPassCheck;
  final bool isConfirmPassCheck;
  final bool isWrongFirstName;
  final bool isWrongLastName;
  final bool isWrongEmail;
  final bool isWrongPhone;
  final bool isWrongPass;
  final bool isWrongConfirmPass;
  final bool isConfirmPasswordObscure;
  final bool isPasswordObscure;

  const SignUpChecksState({
    required this.isFNCheck,
    required this.isLNCheck,
    required this.isEmailCheck,
    required this.isPhoneCheck,
    required this.isPassCheck,
    required this.isConfirmPassCheck,
    required this.isWrongFirstName,
    required this.isWrongLastName,
    required this.isWrongEmail,
    required this.isWrongPhone,
    required this.isWrongPass,
    required this.isWrongConfirmPass,
    required this.isConfirmPasswordObscure,
    required this.isPasswordObscure,
  });
  SignUpChecksState copyWith({
    bool? isFNCheck,
    bool? isLNCheck,
    bool? isEmailCheck,
    bool? isPhoneCheck,
    bool? isPassCheck,
    bool? isConfirmPassCheck,
    bool? isWrongFirstName,
    bool? isWrongLastName,
    bool? isWrongEmail,
    bool? isWrongPhone,
    bool? isWrongPass,
    bool? isWrongConfirmPass,
    bool? isPasswordObscure,
    bool? isConfirmPasswordObscure,
  }) {
    return SignUpChecksState(
      isFNCheck: isFNCheck ?? this.isFNCheck,
      isLNCheck: isLNCheck ?? this.isLNCheck,
      isEmailCheck: isEmailCheck ?? this.isEmailCheck,
      isPhoneCheck: isPhoneCheck ?? this.isPhoneCheck,
      isPassCheck: isPassCheck ?? this.isPassCheck,
      isConfirmPassCheck: isConfirmPassCheck ?? this.isConfirmPassCheck,
      isWrongFirstName: isWrongFirstName ?? this.isWrongFirstName,
      isWrongLastName: isWrongLastName ?? this.isWrongLastName,
      isWrongEmail: isWrongEmail ?? this.isWrongEmail,
      isWrongPhone: isWrongPhone ?? this.isWrongPhone,
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
    isPhoneCheck,
    isPassCheck,
    isConfirmPassCheck,
    isWrongFirstName,
    isWrongLastName,
    isWrongEmail,
    isWrongPhone,
    isWrongPass,
    isWrongConfirmPass,
    isConfirmPasswordObscure,
    isPasswordObscure,
  ];
}

class InitialSignUpChecksState extends SignUpChecksState {
  const InitialSignUpChecksState()
    : super(
        isFNCheck: false,
        isLNCheck: false,
        isEmailCheck: false,
        isPhoneCheck: false,
        isPassCheck: false,
        isConfirmPassCheck: false,
        isWrongFirstName: false,
        isWrongLastName: false,
        isWrongEmail: false,
        isWrongPhone: false,
        isWrongPass: false,
        isWrongConfirmPass: false,
        isConfirmPasswordObscure: true,
        isPasswordObscure: true,
      );
}
