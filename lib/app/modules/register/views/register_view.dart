import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/buttons.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/custom_text_field.dart';

import 'package:nusantara_test_flutter_developer/app/data/models/request/register_request_model.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          CustomTextField(
              controller: controller.nameCon,
              label: "Name",
              obscureText: false),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
              controller: controller.emailCon,
              label: "Email",
              obscureText: false),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
              controller: controller.passwordCon,
              label: "Password",
              obscureText: true),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
              controller: controller.passwordConfirmationCon,
              label: "Password Confirmation",
              obscureText: true),
          const SizedBox(
            height: 40,
          ),
          Obx(
            () => controller.isLoading.isTrue
                ? Button.filled(
                    height: 50,
                    disabled: true,
                    label: "Loading...",
                    onPressed: () {},
                  )
                : Button.filled(
                    height: 50,
                    label: "Register",
                    onPressed: () {
                      final request = RegisterRequestModel(
                        name: controller.nameCon.text,
                        email: controller.emailCon.text,
                        password: controller.passwordCon.text,
                        passwordConfirmation:
                            controller.passwordConfirmationCon.text,
                      );
                      controller.register(request);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
