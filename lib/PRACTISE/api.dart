import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:http/http.dart' as http;


class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  var futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getuserdata();
  }
  // ··

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List<Modal>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
                itemBuilder: (context, index)=> buildSkeleton(context)
                );
                } 
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].title.toString()),
                    leading: Text(snapshot.data![index].id.toString()),
                    trailing: Text(snapshot.data![index].userId.toString()),
                  );
                },
              );
            }));
  }

  Widget buildSkeleton(BuildContext context) => Row(
        children: <Widget>[
          SkeletonContainer.circular(
            width: 70,
            height: 70,
          ),
          const SizedBox(width: 16),
          SkeletonContainer.rounded(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 25,
          ),
          const SizedBox(height: 8),
          SkeletonContainer.rounded(
            width: 50,
            height: 13,
          ),
        ],
      );
}

class Modal {
  final int userId;
  final int id;
  final String title;

  const Modal({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Modal.fromJson(dynamic json) {
    return Modal(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const SkeletonContainer._({
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    Key? key,
  }) : super(key: key);

  const SkeletonContainer.square({
    required double width,
    required double height,
  }) : this._(width: width, height: height);

  const SkeletonContainer.rounded({
    required double width,
    required double height,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : this._(width: width, height: height, borderRadius: borderRadius);

  const SkeletonContainer.circular({
    required double width,
    required double height,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(80)),
  }) : this._(width: width, height: height, borderRadius: borderRadius);

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
        //gradientColor: Colors.orange,
        //shimmerColor: Colors.red,
        //curve: Curves.easeInQuad,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: borderRadius,
          ),
        ),
      );
}

Future<List<Modal>> getuserdata() async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  var jsondata = jsonDecode(response.body);
  List<Modal> users = [];
  /*  print(jsondata); */

  for (var u in jsondata) {
    Modal user = Modal(
      userId: u['userId'],
      id: u['id'],
      title: u['title'],
    );
    users.add(user);
  }
  /*  print(users.length); */
  return users;
}
