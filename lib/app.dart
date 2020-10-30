import 'package:bloc_test/blocs/bloc/authentication_bloc.dart';
import 'package:bloc_test/blocs/event/authentication_event.dart';
import 'package:bloc_test/blocs/state/authentication_state.dart';
import 'package:bloc_test/view/ui/home.dart';
import 'package:bloc_test/view/ui/login.dart';
import 'package:bloc_test/view/ui/splash.dart';
import 'package:bloc_test/view/ui_loading/home_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc();
    authenticationBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        home: BlocConsumer<AuthenticationBloc, dynamic>(
          listener: (context, state) {},
          builder: (context, state) {
            print("State1 = $state");
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            print("State = $state");

            if (state is AuthenticationUnauthenticated) {
              return LoginScreen();
            }
            print("State3 = $state");
            if (state is AuthenticationAuthenticated) {
              return HomeScreen();
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
            return Text("Error");
          },
        ),
      ),
    );
  }
}
