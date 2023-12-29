import 'package:nusantara_test_flutter_developer/app/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(AuthResponseModel model) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(
      'auth_data',
      model.toJson(),
    );
  }

  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('auth_data');
    return AuthResponseModel.fromJson(data!);
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }
}
