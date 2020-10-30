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
    if (event is LoggedIn) {
      yield AuthenticationLoading();
      //await storage.write(key: "token", value: "gvh");
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await storage.delete(key: "token");
      yield AuthenticationUnauthenticated();
    }
    // if (event is UploadData) {
    //   yield TestapiLoading();
    //   try {
    //     List data = await repo.uploadData();
    //     String statuscode = data[0];
    //     print(statuscode);
    //     if (statuscode == "201") {
    //       UsersModel model = data[1];
    //       yield TestapiLoaded(data: statuscode, data2: model);
    //     } else if (statuscode == "NO Internet") {
    //       yield TestapiError(errormsg: "No Internet");
    //     }
    //   } catch (e) {
    //     print(e.toString());
    //     yield TestapiError(errormsg: "Error");
    //   }
    // }
  }
}
