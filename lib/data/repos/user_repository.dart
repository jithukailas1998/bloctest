import 'package:bloc_test/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UserRepository {
  Future<List<Data>> getUsers();
}

class UserRepo implements UserRepository {
  @override
  Future<List<Data>> getUsers() async {
    var response = await http.get("https://reqres.in/api/users?page=2");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Data> user = User.fromJson(data).data;
      return user;
    } else {
      throw Exception();
    }
  }
}
