import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nusantara_test_flutter_developer/app/controllers/books_controller.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/buttons.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/custom_text_field.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/request/create_book_request_model.dart';
import 'package:nusantara_test_flutter_developer/app/data/models/response/book_response_model.dart';

class UpdateBookView extends StatelessWidget {
  const UpdateBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    final id = arguments['id'];
    final books = arguments['book'] as Book;
    final bookController = Get.find<BooksController>();
    initialValue(bookController, books);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Book'),
        centerTitle: true,
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
                bookController.updateBook(id, data);
              },
              label: "Update Book",
              height: 40)
        ],
      ),
    );
  }

  void initialValue(BooksController bookController, Book books) {
    DateTime date = DateFormat("MMM d, y").parseLoose(books.published);
    String formattedDate = DateFormat("yyyy-MM-dd").format(date);
    bookController.isbnCon.text = books.isbn;
    bookController.titleCon.text = books.title;
    bookController.subtitleCon.text = books.subtitle;
    bookController.authorCon.text = books.author;
    bookController.publishedCon.text = formattedDate;
    bookController.publisherCon.text = books.publisher;
    bookController.pagesCon.text = books.pages.toString();
    bookController.descriptionCon.text = books.description;
    bookController.websiteCon.text = books.website;
  }
}
