import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nusantara_test_flutter_developer/app/core/constant/base_url.dart';
import 'package:nusantara_test_flutter_developer/app/data/datasource/local/auth_local_datasource.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/request/create_book_request_model.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/response/book_response_model.dart';

class BookRemoteDatasource {
  final url = BaseUrl.url;
  final Dio dio = Dio();

  Future<Either<String, ListBookResponseModel>> getListBook() async {
    final authData = await AuthLocalDatasource().getAuthData();
    try {
      final response = await dio.get(
        '$url/api/books',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer ${authData.token}"
          },
        ),
      );
      if (response.statusCode == 200) {
        final json = jsonEncode(response.data);
        return Right(ListBookResponseModel.fromJson(json));
      } else {
        return left(
          response.data.toString(),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Either<String, String>> createBook(CreateBookRequestModel data) async {
    final authData = await AuthLocalDatasource().getAuthData();
    try {
      final response = await dio.post(
        "$url/api/books/add",
        data: data.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer ${authData.token}"
          },
          validateStatus: (status) {
            return status == 200 || status == 401 || status == 422;
          },
        ),
      );
      if (response.statusCode == 200) {
        return right("Success Add Book");
      } else {
        return left(
          response.data["errors"].toString(),
        );
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Book>> getDetailBook(String id) async {
    final authData = await AuthLocalDatasource().getAuthData();
    try {
      final response = await dio.get(
        "$url/api/books/$id",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer ${authData.token}"
          },
        ),
      );
      if (response.statusCode == 200) {
        final data = jsonEncode(response.data);
        return right(
          Book.fromJson(data),
        );
      } else {
        return left(
          response.data.toString(),
        );
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> updateBook(
      String id, CreateBookRequestModel data) async {
    final authData = await AuthLocalDatasource().getAuthData();
    try {
      final response = await dio.put(
        "$url/api/books/$id/edit",
        data: data.toMap(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer ${authData.token}"
          },
          validateStatus: (status) {
            return status == 200 || status == 401 || status == 422;
          },
        ),
      );
      if (response.statusCode == 200) {
        return right(
          "Success Update Book",
        );
      } else {
        return left(
          response.data["errors"].toString(),
        );
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> deleteBook(String id) async {
    final authData = await AuthLocalDatasource().getAuthData();
    try {
      final response = await dio.delete(
        "$url/api/books/$id",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer ${authData.token}"
          },
        ),
      );
      if (response.statusCode == 200) {
        return right(
          "Success Delete Book",
        );
      } else {
        return left(
          response.data.toString(),
        );
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
