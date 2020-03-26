import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/archs/mvvm/login_repository.dart';
import 'package:padroes_arquitetura/archs/mvvm/login_viewmodel.dart';
import 'package:padroes_arquitetura/archs/mvvm/user_model.dart';
import 'package:padroes_arquitetura/home_page.dart';

class LoginPageMVVM extends StatefulWidget {
  @override
  _LoginPageMVVMState createState() => _LoginPageMVVMState();
}

class _LoginPageMVVMState extends State<LoginPageMVVM> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final user = UserModel();

  PageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = PageViewModel(repository: LoginRepository());
    viewModel.isLoginOut.listen((isLogin) {
      if(isLogin) {
        loginSuccess();
      } else {
        loginError();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }

  loginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage())
    );
  }

  loginError() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Login error'),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
                onSaved: (value) => user.email = value,
                validator: (value) {
                  if(value.isEmpty){
                    return 'Campo não pode ser vazio';
                  } else if(!value.contains('@')) {
                    return 'Email não é válido';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
                onSaved: (value) => user.password = value,
                validator: (value) {
                  if(value.isEmpty){
                    return 'Campo não pode ser vazio';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 30,),
              StreamBuilder<bool>(
                stream: viewModel.isLoadingOut,
                initialData: false,
                builder: (context, snapshot) {
                  bool isLoading = snapshot.data;
                  return RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('ENTER'),
                    onPressed: isLoading ? null : () {
                      if(!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      viewModel.isLoginIn.add(user);
                    }
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
