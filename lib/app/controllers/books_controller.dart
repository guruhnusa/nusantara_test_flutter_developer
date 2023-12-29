import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/data/datasource/remote/book_remote_datasource.dart';
import 'package:nusantara_test_flutter_developer/app/routes/app_pages.dart';

import '../data/models/request/create_book_request_model.dart';
import '../data/models/response/book_response_model.dart';

class BooksController extends GetxController {
  var isLoading = false.obs;
  late TextEditingController isbnCon;
  late TextEditingController titleCon;
  late TextEditingController subtitleCon;
  late TextEditingController authorCon;
  late TextEditingController publishedCon;
  late TextEditingController publisherCon;
  late TextEditingController pagesCon;
  late TextEditingController descriptionCon;
  late TextEditingController websiteCon;

  @override
  void onInit() {
    isbnCon = TextEditingController();
    titleCon = TextEditingController();
    subtitleCon = TextEditingController();
    authorCon = TextEditingController();
    publishedCon = TextEditingController();
    publisherCon = TextEditingController();
    pagesCon = TextEditingController();
    descriptionCon = TextEditingController();
    websiteCon = TextEditingController();
    super.onInit();
  }

  Future<List<Book>> getListBook() async {
    isLoading(true);
    final response = await BookRemoteDatasource().getListBook();
    return response.fold(
      (error) {
        isLoading(false);
        return [];
      },
      (data) {
        isLoading(false);
        return data.data;
      },
    );
  }

  void createBook(CreateBookRequestModel data) async {
    isLoading(true);
    final response = await BookRemoteDatasource().createBook(data);
    response.fold(
      (error) {
        isLoading(false);
        Get.snackbar("Error", error,
            backgroundColor: Colors.red, colorText: Colors.white);
      },
      (data) {
        isLoading(false);
        clearForm();
        Get.offAllNamed(Routes.DASHBOARD);
        Get.snackbar("Success", data, backgroundColor: Colors.green);
      },
    );
  }

  Future<Book> getDetailBooks(String id) async {
    isLoading(true);
    final response = await BookRemoteDatasource().getDetailBook(id);
    return response.fold(
      (error) {
        isLoading(false);
        throw Exception(error);
      },
      (data) {
        isLoading(false);
        return data;
      },
    );
  }

  void updateBook(String id, CreateBookRequestModel data) async {
    isLoading(true);
    final response = await BookRemoteDatasource().updateBook(id, data);
    response.fold(
      (error) {
        isLoading(false);
        Get.snackbar("Error", error,
            backgroundColor: Colors.red, colorText: Colors.white);
      },
      (data) {
        isLoading(false);
        clearForm();
        Get.offAllNamed(Routes.DASHBOARD);
        Get.snackbar("Success", data, backgroundColor: Colors.green);
      },
    );
  }

  void deleteBook(String id) async {
    isLoading(true);
    final response = await BookRemoteDatasource().deleteBook(id);
    response.fold(
      (error) {
        isLoading(false);
        Get.snackbar("Error", error,
            backgroundColor: Colors.red, colorText: Colors.white);
      },
      (data) {
        isLoading(false);
        Get.offAllNamed(Routes.DASHBOARD);
        Get.snackbar("Success", data, backgroundColor: Colors.green);
      },
    );
  }

  void clearForm() {
    isbnCon.clear();
    titleCon.clear();
    subtitleCon.clear();
    authorCon.clear();
    publishedCon.clear();
    publisherCon.clear();
    pagesCon.clear();
    descriptionCon.clear();
    websiteCon.clear();
  }

  @override
  void onClose() {
    isbnCon.dispose();
    titleCon.dispose();
    subtitleCon.dispose();
    authorCon.dispose();
    publishedCon.dispose();
    publisherCon.dispose();
    pagesCon.dispose();
    descriptionCon.dispose();
    websiteCon.dispose();
    super.onClose();
  }
}
