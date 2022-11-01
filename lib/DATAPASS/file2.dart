import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'file1.dart';


class DataPass2 extends StatefulWidget {
  final PassModal item;
   DataPass2(  {required this.item });

  @override
  State<DataPass2> createState() => _DataPass2State();
}

class _DataPass2State extends State<DataPass2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.item.name),
      ),
    );
  }
}
