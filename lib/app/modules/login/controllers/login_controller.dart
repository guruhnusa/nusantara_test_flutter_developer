import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/data/datasource/local/auth_local_datasource.dart';

import 'package:nusantara_test_flutter_developer/app/data/datasource/remote/auth_remote_datasource.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/views/dashboard_view.dart';

class LoginController extends GetxController {
  late TextEditingController emailCon;
  late TextEditingController passwordCon;
  var isLoading = false.obs;

  @override
  void onInit() {
    emailCon = TextEditingController();
    passwordCon = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailCon.dispose();
    passwordCon.dispose();
    super.onClose();
  }

  void clearForm() {
    emailCon.clear();
    passwordCon.clear();
  }

  void login(String email, String password) async {
    isLoading(true);
    final response = await AuthRemoteDatasource().login(email, password);
    response.fold(
      (error) {
        isLoading(false);
        Get.snackbar("Error", error["message"], backgroundColor: Colors.red);
      },
      (data) {
        isLoading(false);
        clearForm();
        AuthLocalDatasource().saveAuthData(data);
        Get.snackbar("Success", "Login success", backgroundColor: Colors.green);
        Get.offAll(
          () => const DashboardView(),
        );
      },
    );
  }
}
