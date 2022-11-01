import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var mycontroller = TextEditingController();

  var commentlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 300,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: TextField(
                                        autofocus: true,
                                        controller: mycontroller,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          badshamethod();
                                          clearText();
                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(Icons.send))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                icon: Icon(Icons.comment))
          ],
        ),
        body: ListView.builder(
            itemCount: commentlist.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text(commentlist[index]),
                  trailing: IconButton(
                      onPressed: () {
                        deletemethod(index);
                      },
                      icon: Icon(Icons.delete)),
                ),
              );
            }));
  }

  badshamethod() {
    setState(() {
      commentlist.add(mycontroller.text);
    });

    print(commentlist);
  }

  void clearText() {
    mycontroller.clear();
  }

  deletemethod(index) {
    commentlist.removeAt(commentlist[index]);
    mycontroller.clear();
    print(commentlist);
    print(mycontroller.text);
  }
}
