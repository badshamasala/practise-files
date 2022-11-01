import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:practise_files/model/test_model.dart';

import 'package:skeleton_text/skeleton_text.dart';

class Api2 extends StatefulWidget {
  const Api2({super.key});

  @override
  State<Api2> createState() => _Api2State();
}

class _Api2State extends State<Api2> {
  var futureAlbum;

  @override
  void initState() {
    super.initState();
  }
  // ··

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: FutureBuilder<TestModel?>(
              future: testGetUserData(),
              builder: (context, AsyncSnapshot<TestModel?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    TestModel? testModel = snapshot.data;
                    return ListView.builder(
                       /*  physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true, */
                        itemCount: testModel!.genres.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                  testModel.genres[index].id.toString()),
                              Text(
                                  testModel.id.toString()),
                            ],
                          );
                        });
                  }
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ) /* FutureBuilder<List<Modal>>(
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
            }) */
        );
  }
}

/* class Modal {
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
} */

/* Future<Modal1> getuserdata1() async {
  var response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/550?api_key=83beb8d5f3e742eba3e7222adb04366d'));
  Map<String, dynamic> jsondata = jsonDecode(response.body);
  Modal1 users1 = Modal1.fromJson(jsondata);
  print(jsondata);
// where is modal1
  return users1;
} */

Future<TestModel?> testGetUserData() async {
  /* final _logger = Logger(); */
  var response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/550?api_key=83beb8d5f3e742eba3e7222adb04366d'));

  if (response.statusCode == 200) {
    final testModel = testModelFromJson(response.body);
    /* _logger.d(response.body);
    _logger.d(testModel); */
    return testModel;
  } else {
    //handle error
    return null;
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
