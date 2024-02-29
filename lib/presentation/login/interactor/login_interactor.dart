import 'package:clean_architecture/domain/usecase/login_use_case.dart';

class LoginInteractor {

  LoginUseCase loginUseCase = LoginUseCase();
  LoginUseCase registerUseCase = LoginUseCase();
  LoginUseCase getProfileUseCase = LoginUseCase();

  //only a use case example and not returning any response from here
  Future<void> authenticateUser() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    loginUseCase.execute(request: LoginRequest("message", "data"));
  }

  void registerUser() {
    registerUseCase.execute(request: LoginRequest("message", "data"));
  }

  void getProfileData() {
    getProfileUseCase.execute(request: LoginRequest("message", "data"));
  }
}
