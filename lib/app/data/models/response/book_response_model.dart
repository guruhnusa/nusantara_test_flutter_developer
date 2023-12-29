import 'dart:convert';

import 'package:intl/intl.dart';

class ListBookResponseModel {
  int currentPage;
  List<Book> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  ListBookResponseModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory ListBookResponseModel.fromJson(String str) =>
      ListBookResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListBookResponseModel.fromMap(Map<String, dynamic> json) =>
      ListBookResponseModel(
        currentPage: json["current_page"],
        data: List<Book>.from(json["data"].map((x) => Book.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"] ?? "",
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"] ?? "",
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Book {
  int id;
  int userId;
  String isbn;
  String title;
  String subtitle;
  String author;
  String published;
  String publisher;
  int pages;
  String description;
  String website;
  DateTime createdAt;
  DateTime updatedAt;

  Book({
    required this.id,
    required this.userId,
    required this.isbn,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.published,
    required this.publisher,
    required this.pages,
    required this.description,
    required this.website,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json["id"],
        userId: json["user_id"],
        isbn: json["isbn"],
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        published: DateFormat.yMMMd().format(DateTime.parse(json["published"])),
        publisher: json["publisher"],
        pages: json["pages"],
        description: json["description"],
        website: json["website"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published,
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Link {
  String url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"] ?? "",
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
