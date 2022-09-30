import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class ApiCall extends ChangeNotifier {
  List<Datum> users = [];

  List<Datum> searchUsers = [];

  Future<bool> getUsers() async {
    final Uri uri = Uri.parse('https://reqres.in/api/users?page=2');
    var res = await http.get(uri);
    //print(res.body);

    if (res.statusCode == 200) {
      final resData = usersFromJson(res.body);
      users = resData.data;
      print(resData.data[0].email);
      notifyListeners();
      print('users-----${users.first.firstName}');

      return true;
    } else {
      return false;
    }
  }

  void onSearch(String query) {
    if (query.isEmpty) {
      // isSearch = false;
      searchUsers.clear();
      notifyListeners();
      return;
    } else {
      final queryies = query.toLowerCase().trim();
      searchUsers = users.where((element) {
        return element.firstName.toLowerCase().trim().contains(queryies) ||
            element.email.toLowerCase().trim().contains(queryies);
      }).toList();
      notifyListeners();
    }
  }
}
