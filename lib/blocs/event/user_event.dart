import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent {}

class FetchUserEvent extends UserEvent {
  @override
  String toString() => 'FetchUserEvent ';
}
