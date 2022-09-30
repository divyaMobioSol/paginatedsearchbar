// class Person {
//   String name;

//   Person({ required this.name});




// final dataListPerson = <Person>[
//   Person(name: 'Rafaela Pinho', age: 30),
//   Person(name: 'Paulo Emilio Silva', age: 45),
//   Person(name: 'Pedro Gomes', age: 18),
//   Person(name: 'Orlando Guerra', age: 23),
//   Person(name: 'Zacarias Triste', age: 15),
// ];

// final dataListPerson2 = <Person>[
//   Person(name: 'Rafaela Pinho', age: 30),
//   Person(name: 'Paulo Emilio Silva', age: 45),
//   Person(name: 'Pedro Gomes', age: 18),
//   Person(name: 'Orlando Guerra', age: 23),
//   Person(name: 'Zacarias Triste', age: 15),
//   Person(name: 'Antonio Rabelo', age: 33),
//   Person(name: 'Leticia Maciel', age: 47),
//   Person(name: 'Patricia Oliveira', age: 19),
//   Person(name: 'Pedro Lima', age: 15),
//   Person(name: 'Junior Rabelo', age: 33),
//   Person(name: 'Lucia Maciel', age: 47),
//   Person(name: 'Ana Oliveira', age: 19),
//   Person(name: 'Thiago Silva', age: 33),
//   Person(name: 'Charles Ristow', age: 47),
//   Person(name: 'Raquel Montenegro', age: 19),
//   Person(name: 'Rafael Peireira', age: 15),
//   Person(name: 'Nome Comum', age: 33),
//];




// ExampleItem(title: 'Rafaela Pinho' , ),
//   ExampleItem(title: 'Paulo Emilio Silva ',),
//   ExampleItem(title: 'Pedro Gomes ', ),
//   ExampleItem(title: 'Orlando Guerra ', ),
//   ExampleItem(title: 'Zacarias Triste', ),
//   ExampleItem(title: 'Antonio Rabelo',),
//   ExampleItem(title: 'Leticia Maciel',  ),
//   ExampleItem(title: 'Patricia Oliveira', ),
//   ExampleItem(title: 'Pedro Lima',  ),
//   ExampleItem(title: 'Junior Rabelo', ),
//   ExampleItem(title: 'Lucia Maciel',  ),
//   ExampleItem(title: 'Ana Oliveira', ),
//   ExampleItem(title: 'Thiago Silva',  ),
//   ExampleItem(title: 'Charles Ristow',  ),
//   ExampleItem(title: 'Raquel Montenegro',  ),
//   ExampleItem(title: 'Rafael Peireira', ),
//   ExampleItem(title: 'Nome Comum', ),






// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
        required this.support,
    });

    final int page;
    final int perPage;
    final int total;
    final int totalPages;
    final List<Datum> data;
    final Support support;

    Users copyWith({
        required int page,
      required  int perPage,
      required  int total,
      required  int totalPages,
      required  List<Datum> data,
      required  Support support,
    }) => 
        Users(
            page: page ?? this.page,
            perPage: perPage ?? this.perPage,
            total: total ?? this.total,
            totalPages: totalPages ?? this.totalPages,
            data: data ?? this.data,
            support: support ?? this.support,
        );

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    final int id;
    final String email;
    final String firstName;
    final String lastName;
    final String avatar;

    Datum copyWith({
      required  int id,
       required String email,
       required String firstName,
      required  String lastName,
      required  String avatar,
    }) => 
        Datum(
            id: id ?? this.id,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            avatar: avatar ?? this.avatar,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    Support({
        required this.url,
        required this.text,
    });

    final String url;
    final String text;

    Support copyWith({
    required    String url,
    required    String text,
    }) => 
        Support(
            url: url ?? this.url,
            text: text ?? this.text,
        );

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
