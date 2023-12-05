import '../entities/user.dart';

// TODO: anstract Repositroy
abstract class UsersRepository {
  Future<User> getUser(String uid);
}
