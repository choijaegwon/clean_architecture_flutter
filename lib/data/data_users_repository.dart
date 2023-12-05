import 'package:clean_architecture_flutter/domain/entities/user.dart';
import 'package:clean_architecture_flutter/domain/repositories/users_repository.dart';

// 실제 Repository 구현체
class DataUsersRepository extends UsersRepository {
  // TODO: 싱글톤으로 작성 필요
  static final DataUsersRepository _instance = DataUsersRepository._internal();
  factory DataUsersRepository() => _instance;

  DataUsersRepository._internal() {
    init();
  }

  List<User> users = [];

  void init() {
    // TODO: 생설할떄 필요한 로직
    users = [];
    users.addAll([
      User('test-uid', 'John Smith', 18),
      User('test-uid2', 'John Doe', 22)
    ]);
  }

  @override
  Future<User> getUser(String uid) async {
    // 통신 했다는 가정하에 await로 5초 대기 작성
    await Future.delayed(Duration(seconds: 5));
    return users.firstWhere((user) => user.uid == uid);
  }
}
