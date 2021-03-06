import 'package:bloc_test/blocs/bloc/user_bloc.dart';
import 'package:bloc_test/data/repos/user_repository.dart';
import 'package:bloc_test/view/ui/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(repository: UserRepo()),
      child: HomePage(),
    );
  }
}

// import 'package:bloc_test/blocs/bloc/authentication_bloc.dart';
// import 'package:bloc_test/blocs/event/authentication_event.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   AuthenticationBloc authenticationBloc;

//   @override
//   void dispose() {
//     authenticationBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Container(
//         child: Center(
//             child: RaisedButton(
//           child: Text('logout'),
//           onPressed: () {
//             //BlocProvider.of<AuthenticationBloc>(context);
//             BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
//           },
//         )),
//       ),
//     );
//   }
// }
