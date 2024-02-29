import 'package:clean_architecture/data/repository_impl/auth_repository_impl.dart';
import 'package:clean_architecture/domain/repository/auth_repository.dart';
import 'package:clean_architecture/domain/usecase/base_use_case.dart';

class LoginUseCase extends BaseUseCase<LoginRequest, LoginResponse> {

  final AuthRepository _authRepository = AuthRepositoryImpl();

  @override
  Future<LoginResponse> execute({LoginRequest? request}) async {
    _authRepository.loginUser();
    return LoginResponse("Login Successfully", "Syed Ibrahim");
  }
}

class LoginRequest extends Params {
  final String message;
  final String data;

  LoginRequest(this.message, this.data);
}

class LoginResponse {
  final String message;
  final String data;

  LoginResponse(this.message, this.data);
}
