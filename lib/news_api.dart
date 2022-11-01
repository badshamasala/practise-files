import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;
import 'package:practise_files/news_modal.dart';

class BadshakiApi1 extends StatefulWidget {
  const BadshakiApi1({super.key});

  @override
  State<BadshakiApi1> createState() => _BadshakiApi1State();
}

class _BadshakiApi1State extends State<BadshakiApi1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<NewsModal?>(
            future: badshamasala(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.articles.length,
                    itemBuilder: (context, index) {
              /*         print('list - ${snapshot.data!.articles[index].urlToImage.toString()}'); */
                      return Column(
                        children: [
                          snapshot.data ==null ?
                           Placeholder(
                            fallbackHeight: 300,
                           ):
                         snapshot.data!.articles[index].urlToImage == null ?
                              Placeholder(
                                fallbackHeight: 300,
                              )/* Text('${snapshot.data.toString()}') */
                              : Image.network(snapshot
                                  .data!.articles[index].urlToImage, /* errorBuilder:
                                  (context, error, stackTrace) => Icon(Icons.image_not_supported), */ ),
                              ListTile(
                            title: Text(snapshot.data!.articles[index].title 
                                .toString()),
                            subtitle: Text(snapshot
                                .data!.articles[index].source.name
                                .toString()),
                            trailing: Text(snapshot
                                .data!.articles[index].publishedAt
                                .toString()),
                          ),
                        ],
                      );
                    });
              }
            }));
  }
}

Future<NewsModal?> badshamasala() async {
  var response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=keyword&apiKey=b686076c73384e77addd2047b3ad7b2c'));
  if (response.statusCode == 200) {
    final letmodel = newsModalFromJson(response.body);
    return letmodel;
  } else {
    return null;
  }
}
