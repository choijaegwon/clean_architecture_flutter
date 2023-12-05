import 'package:clean_architecture_flutter/domain/repositories/users_repository.dart';
import 'package:clean_architecture_flutter/domain/usecases/get_user_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  final UsersRepository _usersRepository;

  late Function getUserOnComplete;
  late Function getUserOnError;
  late Function getUserOnNext;

  late GetUserUseCase getUserUseCase;

  HomePresenter(this._usersRepository) {
    getUserUseCase = GetUserUseCase(_usersRepository);
  }

  void getUser(String uid) {
    getUserUseCase.execute(
      _HomeUserUseCaseObserver(this),
      GetUserUseCaseParams(uid),
    );
  }

  @override
  void dispose() {
    getUserUseCase.dispose();
  }
}

class _HomeUserUseCaseObserver extends Observer<GetUserUseCaseResponse> {
  final HomePresenter _presenter;
  _HomeUserUseCaseObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.getUserOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getUserOnError(e);
  }

  @override
  void onNext(GetUserUseCaseResponse? response) {
    _presenter.getUserOnNext(response?.user);
  }
}
