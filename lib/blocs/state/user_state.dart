import 'package:bloc_test/data/models/user_model.dart';
import 'package:meta/meta.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

// ignore: must_be_immutable
class UserLoadedState extends UserState {
  List<Data> data;

  UserLoadedState({@required this.data});
}

// ignore: must_be_immutable
class UserErrorState extends UserState {
  String message;

  UserErrorState({@required this.message});
}
