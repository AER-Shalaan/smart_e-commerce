import 'package:equatable/equatable.dart';

class LoginChecksState extends Equatable {
  final bool isEmailCheck;
  final bool isPassCheck;
  final bool isWrongEmail;
  final bool isWrongPassword;
  final bool isPasswordObscure;

  const LoginChecksState({
    required this.isEmailCheck,
    required this.isPassCheck,
    required this.isWrongEmail,
    required this.isWrongPassword,
    required this.isPasswordObscure,
  });

  LoginChecksState copyWith({
    bool? isEmailCheck,
    bool? isPassCheck,
    bool? isWrongEmail,
    bool? isWrongPassword,
    bool? isPasswordObscure,
  }) {
    return LoginChecksState(
      isEmailCheck: isEmailCheck ?? this.isEmailCheck,
      isPassCheck: isPassCheck ?? this.isPassCheck,
      isWrongEmail: isWrongEmail ?? this.isWrongEmail,
      isWrongPassword: isWrongPassword ?? this.isWrongPassword,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
    );
  }

  @override
  List<Object> get props => [
    isEmailCheck,
    isPassCheck,
    isWrongEmail,
    isWrongPassword,
    isPasswordObscure,
  ];
}

class InitialLoginChecksState extends LoginChecksState {
  const InitialLoginChecksState()
    : super(
        isEmailCheck: false,
        isPassCheck: false,
        isWrongEmail: false,
        isWrongPassword: false,
        isPasswordObscure: true,
      );
}
