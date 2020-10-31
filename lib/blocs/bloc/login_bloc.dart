import 'dart:async';
import 'package:bloc_test/blocs/bloc/authentication_bloc.dart';
import 'package:bloc_test/blocs/event/login_event.dart';
import 'package:bloc_test/blocs/state/login_state.dart';
import 'package:bloc_test/data/repos/login_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //final AuthenticationBloc authenticationBloc;
  final LoginRepository repo;

  LoginBloc({
    @required this.repo,
  })  : assert(repo != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    final storage = new FlutterSecureStorage();
    AuthenticationBloc authenticationBloc;
    @override
    Future<void> close() async {
      authenticationBloc.close();
      super.close();
    }

    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        List data;
        data = await repo.authenticate(
          username: event.username,
          password: event.password,
        );
        print(data);
        String token = data[1];
        print("Toke $token");
        await storage.write(key: "token", value: token);
        //authenticationBloc.add(LoggedIn());

        yield LoginSuccess();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
