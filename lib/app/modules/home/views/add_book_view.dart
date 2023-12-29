import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/controllers/books_controller.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/buttons.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/custom_text_field.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/request/create_book_request_model.dart';
import 'package:nusantara_test_flutter_developer/app/modules/home/controllers/home_controller.dart';
import 'package:nusantara_test_flutter_developer/app/routes/app_pages.dart';

class AddBookView extends GetView<HomeController> {
  const AddBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final bookController = Get.find<BooksController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            bookController.clearForm();
            Get.offAllNamed(Routes.DASHBOARD);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomTextField(
            controller: bookController.isbnCon,
            label: "Isbn",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: bookController.titleCon,
            label: "Title",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: bookController.subtitleCon,
            label: "Subtitle",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: bookController.authorCon,
            label: "Author",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            hintText: "YYYY-MM-DD",
            controller: bookController.publishedCon,
            label: "Published",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: bookController.publisherCon,
            label: "Publisher",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            hintText: "Number",
            controller: bookController.pagesCon,
            label: "Pages",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: bookController.descriptionCon,
            label: "Description",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: bookController.websiteCon,
            label: "Website",
            obscureText: false,
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 30,
          ),
          Button.filled(
              onPressed: () {
                final data = CreateBookRequestModel(
                  isbn: bookController.isbnCon.text,
                  title: bookController.titleCon.text,
                  subtitle: bookController.subtitleCon.text,
                  author: bookController.authorCon.text,
                  published: bookController.publishedCon.text,
                  publisher: bookController.publisherCon.text,
                  pages: bookController.pagesCon.text,
                  description: bookController.descriptionCon.text,
                  website: bookController.websiteCon.text,
                );
                bookController.createBook(data);
              },
              label: "Add Book",
              height: 40)
        ],
      ),
    );
  }
}
