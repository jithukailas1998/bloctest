import 'package:meta/meta.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  @override
  String toString() => 'LoginSuccess';
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  String toString() => 'LoginFailure { error: $error }';
}
