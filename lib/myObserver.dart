import 'package:bloc/bloc.dart';

class MyObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('onEvent | Bloc Name: ${bloc.runtimeType} | Event: $event --');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
        'onTransition | Bloc Name: ${bloc.runtimeType} | Transition: $transition --');
  }
}
