import 'dart:convert';

import 'package:apis_getx_app/services/services.dart';
import 'package:apis_getx_app/utils/api.dart';
import '../models/user_model.dart';

class UserController {
  Future<List<User>> getUsers({int limit = 10, int page = 1}) async {
    List<User> users = [];
    final response = await Services().getUsers(limit: limit, page: page);
    try {
      final decodedData = jsonDecode(response.body);
      if (handleApiResponse(response)) {
        decodedData['data'].forEach((user) {
          User newUser = User().fromJson(user);
          users.add(newUser);
        });
      }
    } catch (e) {}
    return users;
  }
}
