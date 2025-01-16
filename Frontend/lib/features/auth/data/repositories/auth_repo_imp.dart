import 'package:chat_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepoImp implements AuthRepository {
  final AuthRemoteDataSources authRemoteDataSources;

  AuthRepoImp({required this.authRemoteDataSources});

  @override
  Future<UserEntity> login(String email, String password) async {
    return await authRemoteDataSources.login(email: email, password: password);
  }

  @override
  Future<UserEntity> register(
      String username, String email, String password) async {
    return await authRemoteDataSources.register(
        username: username, email: email, password: password);
  }
}
