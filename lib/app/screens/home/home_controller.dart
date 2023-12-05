import 'dart:async';

import 'package:clean_architecture_flutter/app/screens/home/home_presenter.dart';
import 'package:clean_architecture_flutter/domain/entities/user.dart';
import 'package:clean_architecture_flutter/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final UsersRepository _usersRepository;

  Completer<User> userCompleter = Completer();

  int _counter;
  int get counter => _counter;

  void counterUp() {
    _counter++;
    refreshUI();
  }

  final HomePresenter _presenter;

  HomeController(this._usersRepository)
      : _counter = 0,
        _presenter = HomePresenter(_usersRepository);

  void getUserOnComplete() {}
  void getUserOnError(e) {}
  void getUserOnNext(User? result) {
    userCompleter.complete(result);
    refreshUI();
  }

  void getUser(String uid) => _presenter.getUser(uid);

  @override
  void initListeners() {
    _presenter.getUserOnComplete = getUserOnComplete;
    _presenter.getUserOnError = getUserOnError;
    _presenter.getUserOnNext = getUserOnNext;
  }
}
