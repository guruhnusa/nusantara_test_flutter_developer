import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/data/datasource/remote/auth_remote_datasource.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/request/register_request_model.dart';

class RegisterController extends GetxController {
  late TextEditingController emailCon;
  late TextEditingController passwordCon;
  late TextEditingController nameCon;
  late TextEditingController passwordConfirmationCon;
  var isLoading = false.obs;

  @override
  void onInit() {
    emailCon = TextEditingController();
    passwordCon = TextEditingController();
    nameCon = TextEditingController();
    passwordConfirmationCon = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailCon.dispose();
    passwordCon.dispose();
    nameCon.dispose();
    passwordConfirmationCon.dispose();
    super.onClose();
  }

  void clearForm() {
    emailCon.clear();
    passwordCon.clear();
    nameCon.clear();
    passwordConfirmationCon.clear();
  }

  void register(RegisterRequestModel data) async {
    isLoading(true);
    final response = await AuthRemoteDatasource().register(data);
    response.fold(
      (error) {
        isLoading(false);
        Get.snackbar(
          "Error",
          error["message"],
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      (data) {
        isLoading(false);
        clearForm();
        Get.back();
        Get.snackbar(
          "Success",
          data,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      },
    );
  }
}
