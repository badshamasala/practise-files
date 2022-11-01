import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
//import 'package:kiosk/check.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // main();
  }

  var logincontroller = TextEditingController();

//we need the function from the server API
  var terminal_code = "";
  var abc = "";
  main() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://103.69.242.42:8080/TestAPI/Appservice.svc/authenticateTerminal'));
    request.body = json.encode(
        {"api_key": "JASLOK1324367890", "terminal_code": "$terminal_code"});
    //print("Login Done");
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      abc = await response.stream.bytesToString();
      if (abc == "true") {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: "Login Success!",
          ),
        );
     /*    Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyFeedback1(terminalcode: terminal_code,))); */
        print('----------- $terminal_code');
      } else {
        //print("sorry");
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: "Invalid Login Id",
          ),
        );
      }
    } else {
      print(response.reasonPhrase);
      //throw Exception('Failed to load post');
      //Navigator.pushNamed(context, "/MyFeedback");
    }
  }

  //Calling API End

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/logo.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 50),
              child: Text(
                'Jaslok Hospital And Research Center',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: logincontroller,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Login ID",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              terminal_code = value;
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SIGN IN',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      main();
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
