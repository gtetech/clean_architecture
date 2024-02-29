import 'package:equatable/equatable.dart';

sealed class LoginScreenEvents extends Equatable {}

class LoginButtonTappedEvent extends LoginScreenEvents {
  final String email;
  final String password;

  LoginButtonTappedEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
