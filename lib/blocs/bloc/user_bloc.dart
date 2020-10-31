import 'package:bloc/bloc.dart';
import 'package:bloc_test/blocs/event/user_event.dart';
import 'package:bloc_test/blocs/state/user_state.dart';
import 'package:bloc_test/data/models/user_model.dart';
import 'package:bloc_test/data/repos/user_repository.dart';
import 'package:meta/meta.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository repository;

  UserBloc({@required this.repository}) : super(null);

  UserState get initialState => UserInitialState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUserEvent) {
      yield UserLoadingState();
      try {
        List<Data> users = await repository.getUsers();
        yield UserLoadedState(data: users);
      } catch (e) {
        yield UserErrorState(message: e.toString());
      }
    }
  }
}
