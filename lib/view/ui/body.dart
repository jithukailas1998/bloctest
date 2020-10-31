import 'package:bloc_test/blocs/bloc/authentication_bloc.dart';
import 'package:bloc_test/blocs/bloc/user_bloc.dart';
import 'package:bloc_test/blocs/event/authentication_event.dart';
import 'package:bloc_test/blocs/event/user_event.dart';
import 'package:bloc_test/blocs/state/user_state.dart';
import 'package:bloc_test/common/ui_common/error.dart';
import 'package:bloc_test/data/models/user_model.dart';
import 'package:bloc_test/view/ui_loading/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc;
  AuthenticationBloc authenticationBloc;

  @override
  void dispose() {
    authenticationBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(FetchUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Material(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Users"),
              centerTitle: true,
              backgroundColor: Colors.red,
              actions: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  },
                ),
              ],
            ),
            body: Container(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserInitialState) {
                    return ShimmerLoader();
                  } else if (state is UserLoadingState) {
                    return ShimmerLoader();
                  } else if (state is UserLoadedState) {
                    return buildUserList(state.data);
                  } else if (state is UserErrorState) {
                    return ErrorState();
                  }
                  return Container();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildUserList(List<Data> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(
              data[pos].avatar,
            ),
            title: Row(
              children: [
                Text(data[pos].firstName),
                SizedBox(width: 10),
                Text(data[pos].lastName),
              ],
            ),
            subtitle: Text(data[pos].email),
          ),
        );
      },
    );
  }
}
