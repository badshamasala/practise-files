import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;
import 'package:practise_files/model/badsha_model.dart';

class Api3 extends StatefulWidget {
  const Api3({super.key});

  @override
  State<Api3> createState() => _Api3State();
}

class _Api3State extends State<Api3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BadshaModal?>(
          future: badshamethod(),
          builder: (context, AsyncSnapshot<BadshaModal?> snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else return ListView.builder(
                /*   itemCount: snapshot.data!.genres.length , */

                itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!.imdbId.toString()),
              );
            });
          }),
    );
  }
}

Future<BadshaModal?> badshamethod() async {
  var response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/550?api_key=83beb8d5f3e742eba3e7222adb04366d'));

  if (response.statusCode == 200) {
    final badshamodel = badshaModalFromJson(response.body);
    return badshamodel;
  } else {
    print('error');
  }
}
