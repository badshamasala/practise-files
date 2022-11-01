import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MyFeedback1 extends StatefulWidget {
  final terminalcode;
  const MyFeedback1({Key? key, required this.terminalcode}) : super(key: key);

  @override
  State<MyFeedback1> createState() => _MyFeedback1State();
}

List<dynamic> _allAct = [];
String? patients;
String? mob;

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Modal {
  final dynamic patient_name;

  const Modal({
    required this.patient_name,
  });

  factory Modal.fromJson(dynamic json) {
    return Modal(
      patient_name: json['patient_name'],
    );
  }
}

class _MyFeedback1State extends State<MyFeedback1> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();

  /* void validate() {
    if (formkey.currentState!.validate()) {
      print("Ok");
    } else {
      print("error");
    }
    if (formkey2.currentState!.validate()) {
      print("Ok");
    } else {
      print("error");
    }
  } */

  /*  void validate2() {
    if (formkey2.currentState!.validate()) {
      print("Ok");
    } else {
      print("error");
    }
  } */

  //String? dropdownValue = list.first;
  @override
  void initState() {
    // TODO: implement initState
    //print(emojiRating);
    //main1();
    // getData();

    // setState(() {
    //   getData();
    // });

    super.initState();
  }

  double fullRating = 0;
  double emojiRating = 0;
  String? gender = "OPD SERVICES"; //no radio button will be selected
  //we need the function from the server API

  var mobile_no = "";
  var rating = "";
  var commentinput = "";
  var starrating = "";
  var patient_name = "";

  //var abcd = "";
  main1() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://103.69.242.42:8080/TestAPI/Appservice.svc/insertIntoFeedback'));
    request.body = json.encode({
      "api_key": "JASLOK1324367890",
      "terminal_code": "001",
      "mobile_no": "$mobile_no",
      "patient_name": "$patient_name",
      "feedback_type": "$rating",
      "comment": "$commentinput",
      "recommend": "$starrating",
      // "ptnfullname": "$ptname",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Icon(
                Icons.check_circle,
                size: 50,
                color: Colors.green,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Thank you!',
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Your submission has been Sent')
                ],
              ),
              actions: [
                // TextButton(
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const MyFeedback1()),
                //   );
                //},
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyFeedback1()),
                      ); */
                    },
                    child: Text("Click Me"),
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15)),
                  ),
                ),
                // )
              ],
            );
          });
      /*   Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MySubmit())); */
    } else {
      print(response.reasonPhrase);
      // showTopSnackBar(
      //   context,
      //   CustomSnackBar.error(
      //     message: "Opps Something wrong!",
      //   ),
      // );
    }
  }

  List<Modal> users = [];
  getData() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://114.143.185.147:1024/Appservice.svc/getPatientName'));
    request.body =
        json.encode({"api_key": "JASLOK1324367890", "mobile_no": "$mobile_no"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var abc = await response.stream.bytesToString();
      // print(abc);
      String arrayText = abc;
      /*    print('abc');
      print(abc); */
      var tagsJson = jsonDecode(arrayText);
      _allAct = tagsJson;
      // print('tagjson');
      // print(tagsJson);

      for (var i = 0; i < _allAct.length; i++) {
        /* print(_allAct[i]); */
        /*    print('----------'); */
        print(_allAct[i]['patient_name']);
        /*  Modal user = Modal(
          patient_name: u[' patient_name'],
        );
        users.add(user); */
      }
      /*   print('-------------');
      print(users);
      print('-------------');
      print(users.length);
      print('-------------'); */
      return users;
    }
    /*  var data1 = ["patient_name"];
      print(data1);

       for (var i = 0; i < _allAct.length; i++) {
        print(_allAct[i]);
      }
      setState(() {}); */
    /*   } else {
      print(response.reasonPhrase);
    } */
  }

  //Get Data from API

  //Get Data from API End

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/logo.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 75,
                ),
              ],
            )),
        backgroundColor: Colors.transparent,
        body: Form(
          key: formkey,
          child: Stack(
            children: [
              Container(),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            Text(
                              'QUICK FEEDBACK',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 33),
                            ),

                            //////////////-----Row 1st Start-----//////////////
                            // for (var i = 0; i < _allAct.length; i++) ...{
                            //   Row(children: [
                            //     //Text("Patient Name:"),
                            //     Text(
                            //       _allAct[i]['patient_name'],
                            //     ),
                            //   ]),
                            //   SizedBox(height: 10),
                            // },
                            /////////////////////////////////////
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mobile No',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  //     child: TextField(
                                  //   style: TextStyle(color: Colors.black),
                                  //   decoration: InputDecoration(
                                  //     fillColor: Color.fromARGB(255, 255, 255, 255),
                                  //     filled: true,
                                  //     hintText: "Mobile No",
                                  //     suffixIcon: IconButton(
                                  //       icon: Icon(Icons.send),
                                  //       onPressed: () {
                                  //         /*    newmethod(); */
                                  //         /*  getData(); */
                                  //         getData();
                                  //       },
                                  //     ),
                                  //     border: OutlineInputBorder(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //     ),
                                  //   ),

                                  //   onChanged: (value) {
                                  //     mobile_no = value;
                                  //   },
                                  // )

                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        filled: true,
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            getData();
                                          },
                                        ),
                                        hintText: "Mobile No",
                                        //labelText: "Mobile No",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Required...";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      mobile_no = value;
                                    },
                                  ),
                                ),

                                // Expanded(child: TextField()),

                                // Expanded(
                                //     child: TextField(
                                //   decoration: InputDecoration(
                                //     enabledBorder: UnderlineInputBorder(
                                //       //<-- SEE HERE
                                //       borderSide: BorderSide(
                                //           width: 3, color: Colors.white),
                                //     ),
                                //     border: UnderlineInputBorder(),
                                //     hintText: '    Your Name',
                                //   ),
                                //   //  onChanged: (value) {
                                //   //   ptname = value;
                                //   //  },
                                // )),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 2.8),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton(
                                      value: patients,
                                      hint: Text(
                                        "  Patient Name",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),

                                      //mapping stateList here for items
                                      items: _allAct.map((e) {
                                        return DropdownMenuItem(
                                          value: e.toString(),
                                          child: Text(
                                            e.toString(),
                                            // style: TextStyle(color: Colors.white),
                                          ),
                                        );
                                      }).toList(),
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 30,
                                      underline: SizedBox(),
                                      iconEnabledColor:
                                          Color.fromARGB(255, 0, 0, 0),
                                      onChanged: (newValue) {
                                        setState(() {
                                          mob = null;
                                          patients = newValue.toString();
                                        });
                                      }),

                                  //     child: new IgnorePointer(
                                  //   ignoring: true,
                                  // ))
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            //////////////-----Row 1st End-----///////////////

                            //////////////-----Row 2st Start-----//////////////
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    '1. YOU VISITED THE HOSPITAL FOR:',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ]),

                            Row(
                              children: [
                                Radio(
                                  // Text("Female"),
                                  value: "OPD SERVICES",
                                  activeColor: Colors.white,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                          Color.fromARGB(255, 180, 239, 182)),
                                  groupValue: gender,
                                  onChanged: (value) {
                                    // setState(() {
                                    //   gender = value.toString();
                                    // });
                                  },
                                ),
                                Text(
                                  'OPD SERVICES',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Radio(
                                  // Text("Female"),
                                  value: "INPATIENT SERVICES",
                                  activeColor: Colors.white,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                          Color.fromARGB(255, 180, 239, 182)),
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                                Text(
                                  "INPATIENT SERVICES",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Radio(
                                  // Text("Female"),
                                  value: "VACCINATION",
                                  activeColor: Colors.white,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                          Color.fromARGB(255, 180, 239, 182)),
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                                Text(
                                  "VACCINATION",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Radio(
                                  // Text("Female"),
                                  value: "EMERGENCY SERVICES",
                                  activeColor: Colors.white,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                          Color.fromARGB(255, 180, 239, 182)),
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                                Text(
                                  "EMERGENCY SERVICES",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //////////////-----Row 2st End-----///////////////

                            //////////////-----Row 3st Start-----//////////////

                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '2 . HOW WOULD YOU RATE THE EXPERIENCE WITH THE SERVICES OF THE HOSPITAL?',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ]),
                            /* Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Image.asset(
                                //   'assets/img/EXCELLENT.png',
                                //   width: 150,
                                //   height: 75,
                                // ),
                                // Image.asset(
                                //   'assets/img/GOOD.png',
                                //   width: 150,
                                //   height: 75,
                                // ),
                                // Image.asset(
                                //   'assets/img/AVERAGE.png',
                                //   width: 150,
                                //   height: 75,
                                // ),
                                // Image.asset(
                                //   'assets/img/POOR.png',
                                //   width: 150,
                                //   height: 75,
                                // ),
                                SizedBox(
                                  width: 28,
                                ),
                              ],
                            ), */
                            Center(
                              child: RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                allowHalfRating: false,
                                unratedColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                itemCount: 5,
                                itemSize: 90.0,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 20.0),
                                updateOnDrag: true,
                                itemBuilder: (context, index) {
                                  switch (index) {
                                    case 1:
                                      return Column(
                                        children: [
                                          Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: emojiRating == 2
                                                ? Colors.green
                                                : Colors.white,
                                          ),
                                          Text(
                                            'EXCELLENT',
                                            style: TextStyle(
                                                fontSize: 5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )
                                        ],
                                      );

                                    case 2:
                                      return Column(
                                        children: [
                                          Icon(
                                            Icons.sentiment_satisfied,
                                            color: emojiRating == 3
                                                ? Colors.lightGreen
                                                : Colors.white,
                                          ),
                                          Text(
                                            'GOOD',
                                            style: TextStyle(
                                                fontSize: 5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )
                                        ],
                                      );

                                    case 3:
                                      return Column(
                                        children: [
                                          Icon(
                                            Icons.sentiment_neutral,
                                            color: emojiRating == 4
                                                ? Colors.amber
                                                : Colors.white,
                                          ),
                                          Text(
                                            'AVERAGE',
                                            style: TextStyle(
                                                fontSize: 5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )
                                        ],
                                      );

                                    case 4:
                                      return Column(
                                        children: [
                                          Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: emojiRating == 5
                                                ? Colors.redAccent
                                                : Colors.white,
                                          ),
                                          Text(
                                            'POOR',
                                            style: TextStyle(
                                                fontSize: 5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )
                                        ],
                                      );
                                    default:
                                      return Container();
                                  }
                                },
                                onRatingUpdate: (ratingvalue) {
                                  print(ratingvalue);
                                  if (ratingvalue == 5.0) {
                                    print("POOR");
                                    rating = "POOR";
                                  } else if (ratingvalue == 4.0) {
                                    print("AVERAGE");
                                    rating = "AVERAGE";
                                  } else if (ratingvalue == 3.0) {
                                    print("GOOD");
                                    rating = "GOOD";
                                  } else if (ratingvalue == 2.0) {
                                    print("EXCELLENT");
                                    rating = "EXCELLENT";
                                  }

                                  setState(() {
                                    emojiRating = ratingvalue;
                                  });
                                },
                              ),
                            ),

                            // Text(
                            //   emojiRating == 5
                            //       ? "POOR"
                            //       : emojiRating == 4
                            //           ? "AVERAGE"
                            //           : emojiRating == 3
                            //               ? "GOOD"
                            //               : emojiRating == 2
                            //                   ? "EXCELLENT"
                            //                   : "",
                            //   style: const TextStyle(
                            //     fontWeight: FontWeight.w600,
                            //     fontSize: 24.0,
                            //     color: Colors.white,
                            //   ),
                            //   textAlign: TextAlign.center,
                            // ),

                            SizedBox(
                              height: 20,
                            ),

                            //////////////-----Row 3st End-----//////////////

                            //////////////-----Row 4st Start-----////////////
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '3. WOULD YOU RECOMMEND THE HOSPITAL TO YOUR FAMILY & FRIEND ?',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ]),
                            Center(
                              child: RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                unratedColor:
                                    Color.fromARGB(255, 233, 228, 228),
                                itemCount: 10,
                                itemSize: 60.0,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                updateOnDrag: true,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (ratingvalue) {
                                  print(ratingvalue);
                                  setState(() {
                                    fullRating = ratingvalue;

                                    if (ratingvalue == 1.0) {
                                      print("1");
                                      starrating = "1";
                                    } else if (ratingvalue == 2.0) {
                                      print("2");
                                      starrating = "2";
                                    } else if (ratingvalue == 3.0) {
                                      print("3");
                                      starrating = "3";
                                    } else if (ratingvalue == 4.0) {
                                      print("4");
                                      starrating = "4";
                                    } else if (ratingvalue == 5.0) {
                                      print("5");
                                      starrating = "5";
                                    } else if (ratingvalue == 6.0) {
                                      print("6");
                                      starrating = "6";
                                    } else if (ratingvalue == 7.0) {
                                      print("7");
                                      starrating = "7";
                                    } else if (ratingvalue == 8.0) {
                                      print("8");
                                      starrating = "8";
                                    } else if (ratingvalue == 9.0) {
                                      print("9");
                                      starrating = "9";
                                    } else if (ratingvalue == 10.0) {
                                      print("10");
                                      starrating = "10";
                                    }
                                  });
                                },
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //////////////-----Row 4st End-----//////////////

                            //////////////-----Row 5st Start-----////////////

                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '4 . ANY ADDITIONAL COMMENTS',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            // TextField(
                            //   style: TextStyle(color: Colors.black),
                            //   decoration: InputDecoration(
                            //       fillColor: Colors.grey.shade100,
                            //       filled: true,
                            //       hintText: "Comment...",
                            //       border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //       )),
                            //   onChanged: (value) {
                            //     commentinput = value;
                            //   },
                            // ),

                            TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                  filled: true,
                                  hintText: "Comment...",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val2) {
                                if (val2!.isEmpty) {
                                  return "Required...";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                commentinput = value;
                              },
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //////////////-----Row 5st End-----////////////

                            //////////////-----Submit Button Start-----////////////
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 15, 15, 15),
                                ),
                                backgroundColor: Color.fromARGB(255, 196, 200, 196),
                                minimumSize: const Size.fromHeight(40), // NEW
                              ),

                              //onPressed: validate,

                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  // TODO submit
                                }
                                /*  if (formkey2.currentState!.validate()) {
                                  // TODO submit
                                } */
                                main1();
                              
                              },

                              // onPressed: () {

                              //   main1() ;
                              // },

                              child: const Text(
                                'SUBMIT',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //////////////-----Submit Button Start-----////////////
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
      ),
    );
  }
}
