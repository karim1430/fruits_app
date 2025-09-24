import 'dart:convert';

import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/feature/auth/data/models/user_model.dart';

UserModel getUser() {
  var json = SharedPreferencesSingleton.getString(BackendEndpoint.saveData);
  var data = {'name': 'name', 'email': 'email', 'uId': 'uId'};
  var encode = jsonEncode(data);
  var user = UserModel.fromJson(jsonDecode(json ?? encode));

  return user;
}
