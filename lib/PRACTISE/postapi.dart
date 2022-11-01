import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Postapi extends StatefulWidget {
  const Postapi({Key? key}) : super(key: key);

  @override
  State<Postapi> createState() => _PostapiState();
}

class _PostapiState extends State<Postapi> {
  var logincontroller = TextEditingController();
  var jobcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          TextField(
            controller: logincontroller,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          /*   TextField(
            controller: jobcontroller,
            decoration: InputDecoration(labelText: 'job title'),
          ), */
          ElevatedButton(
              onPressed: () {
                /*   getuserdata(namecontroller.text, jobcontroller.text); */
                login("JASLOK1324367890", logincontroller.text);
              },
              child: Text('btn'))
        ],
      ),
    );
  }
}


Future login(String key, String tcode) async {
  var response = await http.post(
      Uri.https('service.jaslokhospital.net',
          'api/Appservice.svc/authenticateTerminal'),
      body: {"api_key": key, "terminal_code": tcode});

  var data = response.body;
  print('sssss');
  print("data $data");
  if (response.statusCode == 200) {
    final postModal = jsonDecode(response.body);
    print(postModal);
    return postModal;
  } else {
    return null;
  }
}

/* Future<PostModal?> getuserdata(String name, String job) async {
  var response = await http.post(Uri.https('reqres.in', 'api/users'),
      body: {"name": name, "job": job});

  var data = response.body;
  print(data);
  if (response.statusCode == 201) {
    final postModal = jsonDecode(response.body);
    print(postModal);
  } else {
    return null;
  }
} */

// To parse this JSON data, do
//
//     final postModal = postModalFromJson(jsonString);

/* PostModal postModalFromJson(String str) => PostModal.fromJson(json.decode(str));

String postModalToJson(PostModal data) => json.encode(data.toJson());

class PostModal {
  PostModal({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory PostModal.fromJson(Map<String, dynamic> json) => PostModal(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
} */
