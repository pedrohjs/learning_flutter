import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/archs/mvp/login_repository.dart';
import 'package:padroes_arquitetura/archs/mvp/user_model.dart';

abstract class LoginPageContract {
  void loginSuccess();
  void loginError();
  void loginManager();
}

class LoginPresenter {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final LoginRepository repository;
  final LoginPageContract viewContract;
  LoginPresenter(this.viewContract, {this.repository});

  UserModel user = UserModel();

  userEmail(String value) => user.email = value;
  userPassword(String value) => user.password = value;

  login() async {
    bool isLogin;
    isLoading = true;
    viewContract.loginManager();
    if(!formKey.currentState.validate()) {
      isLogin = false;
    } else {
      formKey.currentState.save();
      try {
        isLogin = await repository.doLogin(user);
      } catch(e) {
        isLogin = false;
      }
    }

    isLoading = false;
    viewContract.loginManager();

    if(isLogin) {
      viewContract.loginSuccess();
    } else {
      viewContract.loginError();
    }
  }
}