import 'dart:async';

import 'package:clean_architecture_flutter/domain/entities/user.dart';
import 'package:clean_architecture_flutter/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// TODO: 요구사항에 맞는 Entity로 변경
class GetUserUseCase
    extends UseCase<GetUserUseCaseResponse, GetUserUseCaseParams> {
  // TODO: abstract Repository
  final UsersRepository usersRepository;
  GetUserUseCase(this.usersRepository);

  @override
  Future<Stream<GetUserUseCaseResponse>> buildUseCaseStream(
      GetUserUseCaseParams? params) async {
    // TODO: abstract Repository에 맞는 메서드 가져오기
    final controller = StreamController<GetUserUseCaseResponse>();
    try {
      final user = await usersRepository.getUser(params!.uid);
      controller.add(GetUserUseCaseResponse(user));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

// TODO: Stream을 통해서 얻고싶은 결과값
class GetUserUseCaseResponse {
  final User user;
  GetUserUseCaseResponse(this.user);
}

// TODO: Params 또는 Void
class GetUserUseCaseParams {
  final String uid;
  GetUserUseCaseParams(this.uid);
}
