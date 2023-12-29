// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nusantara_test_flutter_developer/app/controllers/books_controller.dart';
import 'package:nusantara_test_flutter_developer/app/core/components/buttons.dart';
import 'package:nusantara_test_flutter_developer/app/routes/app_pages.dart';

class DetailBookView extends StatelessWidget {
  const DetailBookView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments['id'];
    final bookController = Get.find<BooksController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Book Page'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: bookController.getDetailBooks(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final books = snapshot.data!;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Isbn : ${books.isbn}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Title : ${books.title}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Subtitle : ${books.subtitle}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Author : ${books.author}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Published : ${books.published}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Publisher : ${books.publisher}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Pages : ${books.pages}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Description : ${books.description}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Button.filled(
                    onPressed: () {
                      Get.toNamed(
                        Routes.UPDATEBOOK,
                        arguments: {
                          "id": id,
                          'book': books,
                        },
                      );
                    },
                    label: "Update",
                    height: 40,
                  ),
                  const SizedBox(height: 20),
                  Button.outlined(
                    onPressed: () {
                      bookController.deleteBook(id);
                    },
                    label: "Delete",
                    height: 40,
                  )
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
