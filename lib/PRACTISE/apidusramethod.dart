import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  // list to store data;
  List alldata = [];
  var author;
  var images;
  //url
  final url =
      "https://newsapi.org/v2/everything?q=keyword&apiKey=b686076c73384e77addd2047b3ad7b2c";
  // Api Call
  getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var data1 = data["articles"];

        for (int i = 0; i < data1.length; i++) {
          alldata.add(data1[i]);
          // print(alldata);
          // print(alldata[i]["author"]);
          author = alldata[i]["author"];
          print("Author is .....");
          print(author);
          print("Images is is.....");
          images = alldata[i]["urlToImage"];
          print(images);
          setState(() {});
        }
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api test")),
      body: ListView.builder(
        itemCount: alldata.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: alldata[index]["urlToImage"] != null
                ? Image.network(alldata[index]["urlToImage"].toString())
                : Container(
                    child: Image.network(
                        "https://placehold.jp/30/dd6699/ffffff/300x150.png?text=placeholder+image"),
                  ),
            title: Text(alldata[index]["author"] ?? "no data"),
          );
        },
      ),
    );
  }
}
