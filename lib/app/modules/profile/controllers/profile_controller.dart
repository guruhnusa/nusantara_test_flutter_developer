import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/data/datasource/local/auth_local_datasource.dart';
import 'package:nusantara_test_flutter_developer/app/data/datasource/remote/auth_remote_datasource.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/response/user_response_model.dart';
import 'package:nusantara_test_flutter_developer/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;

  Future<UserResponseModel> getUser() async {
    final response = await AuthRemoteDatasource().getUser();
    return response.fold(
      (error) {
        throw Exception(error);
      },
      (data) {
        return data;
      },
    );
  }

  void logout() async {
    isLoading(true);
    final response = await AuthRemoteDatasource().logout();
    response.fold(
      (error) {
        isLoading(false);
        Get.snackbar("Error", error, backgroundColor: Colors.red);
      },
      (data) {
        isLoading(false);
        AuthLocalDatasource().removeAuthData();
        Get.snackbar("Success", data, backgroundColor: Colors.green);
        Get.offAllNamed(Routes.LOGIN);
      },
    );
  }
}
