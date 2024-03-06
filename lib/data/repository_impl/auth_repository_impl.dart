import 'package:clean_architecture/data/data_source/api_service.dart';
import 'package:clean_architecture/data/mappers/user_mapper.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  //interacting with data source
  ApiService apiService = ApiService();

  @override
  Future<UserEntity> loginUser() async {
    final response = apiService.getUser();
    return UserMapper().map(response);
  }
}
