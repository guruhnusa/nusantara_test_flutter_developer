import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/buttons.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: FutureBuilder(
        future: controller.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  snapshot.data!.name,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  snapshot.data!.email,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Button.filled(
                              onPressed: () {
                                controller.logout();
                              },
                              label: "Logout",
                              height: 50,
                            ),
                          ),
                        ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
