import 'package:flutter/material.dart';

class Disablebutton extends StatefulWidget {
  const Disablebutton({Key? key}) : super(key: key);

  @override
  State<Disablebutton> createState() => _DisablebuttonState();
}

class _DisablebuttonState extends State<Disablebutton> {
  var cont1 = TextEditingController();
  var cont2 = TextEditingController();
  bool isbtnactive =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cont1.addListener(() {
      final isbtnactive = cont1.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          TextField(
            controller: cont1,
          ),
          TextField(
            controller: cont2,
          ),
          ElevatedButton(onPressed:isbtnactive? () {}:null, child: Text('sada'))
        ],
      ),
    );
  }
}
