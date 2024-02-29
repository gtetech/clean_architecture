import 'package:clean_architecture/core/extensions/extensions.dart';
import 'package:clean_architecture/presentation/login/bloc/login_screen_events.dart';
import 'package:clean_architecture/presentation/login/bloc/login_screen_states.dart';
import 'package:clean_architecture/presentation/login/interactor/login_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginScreenEvents, LoginScreenState> {
  LoginBloc() : super(LoginScreenState.initial()) {
    on<LoginButtonTappedEvent>(authenticateUser);
  }
  bool _success = false;
  final LoginInteractor _loginInteractor = LoginInteractor();

  Future<void> authenticateUser(
      LoginButtonTappedEvent event, Emitter<LoginScreenState> emit) async {
    if (event.email.isEmpty) {
      emit(state.copyWith(
          states: LoginStates.validationErrors,
          validationErrors:
              const LoginValidationErrors(emailError: "Empty Email")));
      return;
    }
    if (!event.email.isValidEmail()) {
      emit(state.copyWith(
          states: LoginStates.validationErrors,
          validationErrors:
              const LoginValidationErrors(emailError: "Enter Valid Email")));
      return;
    }
    if (event.password.isEmpty) {
      emit(state.copyWith(
          states: LoginStates.validationErrors,
          validationErrors:
              const LoginValidationErrors(passwordError: "Empty Password")));
      return;
    }
    if (!event.password.isValidPassword()) {
      emit(state.copyWith(
          states: LoginStates.validationErrors,
          validationErrors: const LoginValidationErrors(
              passwordError:
                  "Password length must be greater than or equal to 6 characters")));
      return;
    }
    emit(state.copyWith(states: LoginStates.loading));
    await _loginInteractor.authenticateUser();

    //for showing success and failure each time
    if (_success) {
      emit(state.copyWith(
          states: LoginStates.success,
          successMessage: "User authenticated successfully!"));
    } else {
      emit(state.copyWith(
          states: LoginStates.error, errorMessage: "Something went wrong!"));
    }
    _success = !_success;
  }
}
