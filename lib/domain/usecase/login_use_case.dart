
import 'package:clean_architecture/data/repository_impl/auth_repository_impl.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repository/auth_repository.dart';
import 'package:clean_architecture/core/helper/base_use_case.dart';

class LoginUseCase extends BaseUseCase<LoginRequest, UserEntity> {

  final AuthRepository _authRepository = AuthRepositoryImpl();

  @override
  Future<UserEntity> execute({LoginRequest? request}) async {
    final user = await _authRepository.loginUser();
    return user;
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
