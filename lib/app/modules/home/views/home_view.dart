import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_test_flutter_developer/app/controllers/books_controller.dart';

import 'package:nusantara_test_flutter_developer/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bookController = Get.put(BooksController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: bookController.getListBook(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text("Tidak Ada Buku"),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final book = snapshot.data![index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAILBOOK,
                        arguments: {"id": "${book.id}}"},
                      );
                    },
                    title: Text(
                      book.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(book.subtitle),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADDBOOK);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
