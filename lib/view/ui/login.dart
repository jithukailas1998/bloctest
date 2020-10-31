import 'package:bloc_test/blocs/bloc/login_bloc.dart';
import 'package:bloc_test/blocs/event/login_event.dart';
import 'package:bloc_test/blocs/state/login_state.dart';
import 'package:bloc_test/data/repos/login_repo.dart';

import 'package:bloc_test/view/ui/home.dart';
import 'package:bloc_test/view/ui_loading/home_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: BlocProvider(
          create: (BuildContext context) => LoginBloc(repo: LoginRepository()),
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, dynamic>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoginInitial) {
          return initialPage();
        }
        if (state is LoginLoading) {
          return LoadingIndicator();
        }
        if (state is LoginSuccess) {
          return HomeScreen();
        }
        if (state is LoginFailure) {
          print("In builder ${state.error}");
        }

        return Text("Error");
      },
    );
  }

  //
  Widget initialPage() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'username'),
            controller: usernameController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'password'),
            controller: passwordController,
            obscureText: true,
          ),
          FlatButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context)
                  ..add(LoginButtonPressed(
                    username: usernameController.text,
                    password: passwordController.text,
                  ));
              },
              child: Text("fetch")),
        ],
      ),
    );
  }
}
