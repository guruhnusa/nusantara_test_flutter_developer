import 'dart:convert';

class CreateBookRequestModel {
  String isbn;
  String title;
  String subtitle;
  String author;
  String published;
  String publisher;
  String pages;
  String description;
  String website;

  CreateBookRequestModel({
    required this.isbn,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.published,
    required this.publisher,
    required this.pages,
    required this.description,
    required this.website,
  });

  factory CreateBookRequestModel.fromJson(String str) =>
      CreateBookRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateBookRequestModel.fromMap(Map<String, dynamic> json) =>
      CreateBookRequestModel(
        isbn: json["isbn"],
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        published: json["published"],
        publisher: json["publisher"],
        pages: json["pages"],
        description: json["description"],
        website: json["website"],
      );

  Map<String, dynamic> toMap() => {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published,
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website,
      };
}
