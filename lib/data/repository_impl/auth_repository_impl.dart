import 'package:clean_architecture/data/data_source/api_service.dart';
import 'package:clean_architecture/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  //interacting with data source
  ApiService apiService = ApiService();

  @override
  Future<Object> loginUser() async {
    return Object();
  }
}
