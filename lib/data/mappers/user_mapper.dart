import 'package:clean_architecture/core/helper/mapper.dart';
import 'package:clean_architecture/data/models/user_model.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';

class UserMapper extends Mapper<UserModel, UserEntity> {
  @override
  UserEntity map(UserModel source) {
    return UserEntity(source.fullName);
  }
}
