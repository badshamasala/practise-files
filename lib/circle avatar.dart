import 'package:flutter/material.dart';


class CircleAvatar1 extends StatefulWidget {
  const CircleAvatar1({Key? key}) : super(key: key);

  @override
  State<CircleAvatar1> createState() => _CircleAvatar1State();
}

class _CircleAvatar1State extends State<CircleAvatar1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(''),
      ),
      body: Column(
        children: [
          Center(
            child: Stack(alignment: Alignment.bottomRight, children: [
              CircleAvatar(
                radius: 40,
              ),
              Positioned(
                top: 55,
                left: 55,
                child: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        constraints: BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 15,
                        ))),
              )
            ]),
          ),
          Stack(children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.blue),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEy-kTdzunuQ0fvD-cFqLqamWoLtKzfIVEqw&usqp=CAU',
                  width: 50,
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 50,
              child: Container(
                  height: 20,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      shape: BoxShape.circle,
                      color: Colors.blue),
                  child: IconButton(
                      padding: EdgeInsets.all(0),
                      constraints: BoxConstraints(),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 15,
                      ))),
            )
          ]),
        ],
      ),
    );
  }
}
