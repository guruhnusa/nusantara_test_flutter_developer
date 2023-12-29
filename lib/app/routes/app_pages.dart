import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/views/add_book_view.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/views/dashboard_view.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/views/detail_book_view.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/views/update_book_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADDBOOK,
      page: () => const AddBookView(),
    ),
    GetPage(
      name: _Paths.DETAILBOOK,
      page: () => const DetailBookView(),
    ),
    GetPage(
      name: _Paths.UPDATEBOOK,
      page: () => const UpdateBookView(),
    ),
  ];
}
