import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class BadshakiApi extends StatefulWidget {
  const BadshakiApi({super.key});

  @override
  State<BadshakiApi> createState() => _BadshakiApiState();
}

class _BadshakiApiState extends State<BadshakiApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Model3?>(
            future: badshamasala(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              } else
                return ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(snapshot.data!.support.text.toString()),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data!.data[index].avatar),
                            ),
                            title: Text(
                                snapshot.data!.data[index].firstName.toString() +
                                    snapshot.data!.data[index].lastName.toString()),
                            subtitle:
                                Text(snapshot.data!.data[index].email.toString()),
                            trailing:
                                Text(snapshot.data!.data[index].id.toString()),
                          ),
                        ],
                      );
                    });
            }));
  }
}

Future<Model3?> badshamasala() async {
  var response = await http.get(Uri.parse('https://reqres.in/api/users'));
  if (response.statusCode == 200) {
    final letmodel = model3FromJson(response.body);
    return letmodel;
  } else {
    print('error');
  }
}
// To parse this JSON data, do
//
//     final model3 = model3FromJson(jsonString);

Model3 model3FromJson(String str) => Model3.fromJson(json.decode(str));

String model3ToJson(Model3 data) => json.encode(data.toJson());

class Model3 {
  Model3({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Datum> data;
  Support support;

  factory Model3.fromJson(Map<String, dynamic> json) => Model3(
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

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

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

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
