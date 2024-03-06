import 'package:clean_architecture/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> loginUser();
}
