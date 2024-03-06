import 'package:equatable/equatable.dart';

enum LoginStates { initial, loading, success, error,validationErrors }

class LoginScreenState extends Equatable {
  final LoginStates states;
  final String? successMessage;
  final String? errorMessage;
  final LoginValidationErrors? validationErrors;



  factory LoginScreenState.initial() =>
      const LoginScreenState(states: LoginStates.initial);

  LoginScreenState copyWith({
    LoginStates? states,
    String? successMessage,
    String? errorMessage,
    LoginValidationErrors? validationErrors,
  }) {
    return LoginScreenState(
      states: states ?? this.states,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      validationErrors: validationErrors,
    );
  }

  const LoginScreenState({
    required this.states,
    this.successMessage,
    this.errorMessage,
    this.validationErrors,
  });

  @override
  List<Object?> get props =>
      [states, successMessage, errorMessage, validationErrors];
}

class LoginValidationErrors {
  final String? emailError;
  final String? passwordError;

  const LoginValidationErrors({this.emailError, this.passwordError});
}
