import 'package:bloc_test/blocs/bloc/authentication_bloc.dart';
import 'package:bloc_test/blocs/event/authentication_event.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // AuthenticationBloc authenticationBloc =
    //     BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text('logout'),
          onPressed: () {
            //authenticationBloc.add(LoggedOut());
          },
        )),
      ),
    );
  }
}
