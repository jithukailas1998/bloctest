import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/blocs/event/authentication_event.dart';
import 'package:bloc_test/blocs/state/authentication_state.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    final storage = new FlutterSecureStorage();

// Read value
    //String value = await storage.read(key: "token");
    if (event is AppStarted) {
      print("Event 1 =$event");
      String value = await storage.read(key: "token");
      print("Value = ${value.isEmpty}");
      if (value.isEmpty) {
        yield AuthenticationUnauthenticated();
      }
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await storage.delete(key: "token");
      yield AuthenticationUnauthenticated();
    }
  }
}
