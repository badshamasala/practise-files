import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GuestLogin extends StatefulWidget {
  const GuestLogin({super.key});

  @override
  State<GuestLogin> createState() => _GuestLoginState();
}

class _GuestLoginState extends State<GuestLogin> {
  /*  Language _site = Language.english; */
  dynamic groupvalue;

  var hindi = 'Hindi';
  var english = 'English';

  var bengali = 'Bengali';
  var gujarati = 'Gujarati';
  var marathi = 'Marathi';
  var urdu = 'Urdu';
  var odia = 'Odia';
  var kannada = 'Kannada';
  var tamil = 'Tamil';
  var telugu = 'Telugu';

  @override
  Widget build(BuildContext context) {
    Size size;
    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              Image.asset('assets/group1.png'),
              const Text(
                'your favorite star',
                style: TextStyle(
                  color: Color(0xff515253),
                  fontFamily: 'Poppins',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      color: Colors.black,
                                      height: 5,
                                      width: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Select your language'),
                                  const Divider(),
                                  ListTile(
                                    visualDensity: VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text(
                                      'English',
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                    trailing: Radio(
                                      value: english,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = english;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text(
                                      'Hindi',
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                    trailing: Radio(
                                      value: hindi,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = hindi;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text('Bengali',
                                        style:
                                            TextStyle(fontFamily: 'Poppins')),
                                    trailing: Radio(
                                      value: bengali,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = bengali;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text('Gujarati',
                                        style:
                                            TextStyle(fontFamily: 'Poppins')),
                                    trailing: Radio(
                                      value: gujarati,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = gujarati;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text('Marathi',
                                        style:
                                            TextStyle(fontFamily: 'Poppins')),
                                    trailing: Radio(
                                      value: marathi,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = marathi;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text('Urdu',
                                        style:
                                            TextStyle(fontFamily: 'Poppins')),
                                    trailing: Radio(
                                      value: urdu,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = urdu;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text('Odia (oria)',
                                        style:
                                            TextStyle(fontFamily: 'Poppins')),
                                    trailing: Radio(
                                      value: odia,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = odia;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text('Kannada',
                                        style:
                                            TextStyle(fontFamily: 'Poppins')),
                                    trailing: Radio(
                                      value: kannada,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = kannada;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text('Tamil',
                                        style:
                                            TextStyle(fontFamily: 'Poppins')),
                                    trailing: Radio(
                                      value: tamil,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = tamil;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -3),
                                    dense: true,
                                    leading: const Text('Telugu',
                                        style:
                                            TextStyle(fontFamily: 'Poppins')),
                                    trailing: Radio(
                                      value: telugu,
                                      groupValue: groupvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupvalue = telugu;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              );
                            });
                          },
                        );
                      },
                      child: const Text(
                        'Select your language',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                  const FaIcon(
                    FontAwesomeIcons.globe,
                    size: 15,
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                // height: 50,
                child: ElevatedButton(
                  onPressed: () {
        /*             Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    ); */
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(0.0, 40),
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: 40.0, vertical: 20.0),
                      backgroundColor: const Color(0xff0087FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneNumber()),
                    ); */
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xff0087FF),
                      ),
                      /*  padding: EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 20.0), */
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: const Text(
                    "Guest Login",
                    style: TextStyle(color: Color(0xff0087FF), fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('don\'t have an account?'),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
        /*             Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneNumber()),
                    ); */
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xff0087FF),
                      ),
                      /*  padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20.0), */
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Color(0xff0087FF), fontSize: 18),
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

/* enum Language {
  english,
  hindi,
  marathi,
  urud,
  telugu,
  bengali,
  gujrati,
  odia,
  kannada,
  tamil
} */

