import 'package:shared_preferences/shared_preferences.dart';
import '../models/response/auth_response_model.dart';

class AuthLocalDatasource {
  static const authKey = 'authKey';

  Future<bool> saveAuthData(AuthResponse model) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString(authKey, model.toRawJson());
    return result;
  }

  Future<bool> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.remove(authKey);
    return result;
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString(authKey);
    if (authJson == null || authJson.isEmpty) {
      return null;
    }
    final authModel = AuthResponse.fromRawJson(authJson);
    return authModel.token;
  }

  Future<int?> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString(authKey);
    if (authJson == null || authJson.isEmpty) {
      return null;
    }
    final authModel = AuthResponse.fromRawJson(authJson);
    return authModel.user?.id;
  }

  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString(authKey);
    return authJson != null && authJson.isNotEmpty;
  }
}
