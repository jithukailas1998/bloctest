import 'package:bloc_test/app.dart';
import 'package:bloc_test/myObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //
  Bloc.observer = MyObserver();
  runApp(App());
}
