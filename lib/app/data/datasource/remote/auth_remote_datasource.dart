import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nusantara_test_flutter_developer/app/data/datasource/local/auth_local_datasource.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/request/register_request_model.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/response/user_response_model.dart';

import '../../../core/constant/base_url.dart';
import '../../models/response/auth_response_model.dart';

class AuthRemoteDatasource {
  final url = BaseUrl.url;
  final Dio dio = Dio();
  Future<Either<Map<String, dynamic>, AuthResponseModel>> login(
      String email, String password) async {
    final body = {"email": email, "password": password};
    try {
      final response = await dio.post(
        '$url/api/login',
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          validateStatus: (status) {
            return status == 200 || status == 401;
          },
        ),
      );
      if (response.statusCode == 200) {
        return Right(
          AuthResponseModel.fromJson(
            jsonEncode(response.data),
          ),
        );
      } else {
        final errorData = response.data as Map<String, dynamic>;
        return Left(errorData);
      }
    } catch (e) {
      return const Left({
        "message": "Something went wrong, please try again later",
      });
    }
  }

  Future<Either<Map<String, dynamic>, String>> register(
      RegisterRequestModel data) async {
    final body = {
      "name": data.name,
      "email": data.email,
      "password": data.password,
      "password_confirmation": data.passwordConfirmation,
    };
    try {
      final response = await dio.post(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register',
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          validateStatus: (status) {
            return status == 200 || status == 401 || status == 422;
          },
        ),
      );
      if (response.statusCode == 200) {
        return Right(
          response.data["message"],
        );
      } else {
        final errorData = response.data as Map<String, dynamic>;
        return Left(errorData);
      }
    } catch (e) {
      return const Left(
        {
          "message": "Something went wrong, please try again later",
        },
      );
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    try {
      final response = await dio.delete(
        '$url/api/user/logout',
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Authorization": "Bearer ${authData.token}"
          },
        ),
      );

      if (response.statusCode == 200) {
        return const Right("Logout success");
      } else {
        final errorData = response.data as Map<String, dynamic>;
        return Left(errorData["message"]);
      }
    } catch (e) {
      return const Left(
        "Something went wrong, please try again later",
      );
    }
  }

  Future<Either<String, UserResponseModel>> getUser() async {
    final authData = await AuthLocalDatasource().getAuthData();
    try {
      final response = await dio.get(
        '$url/api/user',
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Authorization": "Bearer ${authData.token}"
          },
          validateStatus: (status) {
            return status == 200 || status == 401 || status == 422;
          },
        ),
      );

      if (response.statusCode == 200) {
        return Right(
          UserResponseModel.fromJson(
            jsonEncode(response.data),
          ),
        );
      } else {
        final errorData = response.data as Map<String, dynamic>;
        return Left(errorData["message"]);
      }
    } catch (e) {
      return const Left(
        "Something went wrong, please try again later",
      );
    }
  }
}
