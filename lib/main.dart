import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/controllers/books_controller.dart';
import 'package:nusantara_test_flutter_developer/app/data/datasource/local/auth_local_datasource.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/views/dashboard_view.dart';
import 'package:nusantara_test_flutter_developer/app/modules/login/controllers/login_controller.dart';
import 'package:nusantara_test_flutter_developer/app/modules/login/views/login_view.dart';
import 'package:nusantara_test_flutter_developer/app/modules/profile/controllers/profile_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController(), permanent: true);
  Get.put(ProfileController(), permanent: true);
  Get.put(BooksController(), permanent: true);
  runApp(
    GetMaterialApp(
      getPages: AppPages.routes,
      title: "Nusantara Test Flutter Developer",
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthLocalDatasource().getAuthData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const DashboardView();
        } else {
          return const LoginView();
        }
      },
    );
  }
}
