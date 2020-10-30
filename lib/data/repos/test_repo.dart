import 'package:bloc_test/common/utils/apiString.dart';
import 'package:bloc_test/data/models/test_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserRepository {
  Future<List> authenticate({
    @required String username,
    @required String password,
  }) async {
    String apiUrl = ApiLogin.loginApi;
    List data;
    try {
      var resp = await http
          .post(apiUrl, body: {"email": username, "password": password});
      var data2 = json.decode(resp.body);
      if (resp.statusCode == 200) {
        Usertoken model = Usertoken.fromJson(data2);
        //print("model = ${model.token}");
        data = ["201", model.token];
      } else if (resp.statusCode == 201) {
        data = ["200", "Success"];
      } else if (resp.statusCode == 301) {
        data = ["301", "moved permanently"];
      } else if (resp.statusCode == 400) {
        data = ["400", "Bad Request"];
      } else if (resp.statusCode == 404) {
        data = ["404", "Not Found"];
      } else if (resp.statusCode == 422) {
        data = ["422", "Validation Error"];
      } else if (resp.statusCode == 500) {
        data = ["500", "Server Error"];
      } else {
        data = ["got error", "Unknown Error"];
      }
    } catch (e) {
      data = ["NO Internet", "Exception Error"];
    }
    return data;
  }
}
