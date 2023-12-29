import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/buttons.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/custom_text_field.dart';
import 'package:nusantara_test_flutter_developer/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          CustomTextField(
              controller: controller.emailCon,
              label: "Email",
              obscureText: false),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              controller: controller.passwordCon,
              label: "Password",
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
                    label: "Login",
                    onPressed: () {
                      controller.login(controller.emailCon.text,
                          controller.passwordCon.text);
                    },
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          Button.outlined(
            height: 50,
            label: "Register",
            onPressed: () {
              Get.toNamed(Routes.REGISTER);
            },
          ),
        ],
      ),
    );
  }
}
