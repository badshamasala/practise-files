import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practise_files/DATAPASS/file2.dart';


class DataPass extends StatefulWidget {
  const DataPass({super.key});

  @override
  State<DataPass> createState() => _DataPassState();
}

class _DataPassState extends State<DataPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        
        itemCount: products.length,
        itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  DataPass2(item: products[index],)
                      ),
                );
          },
          child: ListTile(
            title: Text(products[index].name),
          ),
        );
      }),
    );
  }
}

class PassModal {
  final String name;
  final String id;

  PassModal({required this.name, required this.id});
}

final products = [

  PassModal(name: 'rashid', id: '1'),
  PassModal(name: 'farhan', id: '1'),
  PassModal(name: 'badsha', id: '1'),
  PassModal(name: 'masala', id: '1'),
];
