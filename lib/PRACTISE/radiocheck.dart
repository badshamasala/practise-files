import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Radiocheck extends StatefulWidget {
  const Radiocheck({Key? key}) : super(key: key);

  @override
  State<Radiocheck> createState() => _RadiocheckState();
}

class _RadiocheckState extends State<Radiocheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Consumer<RadioProvider>(
        builder: (context, radioProvider, _) {
        return Column(
          children: [
            ElevatedButton(
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
                    builder: (context) {
                      return Selector<RadioProvider, int>(
                          selector: (p0, p1) => p1.selectedIndex,
                          builder: (context, selectedIndex, _) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Text(radioProvider.name[0]),
                                  trailing: Radio(
                                      value: radioProvider.name[0],
                                      groupValue:
                                          radioProvider.name[selectedIndex],
                                      onChanged: (value) {
                                        radioProvider.setIndex(0);
                                      }),
                                ),
                               const SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  leading: Text(radioProvider.name[1]),
                                  trailing: Radio(
                                      value: radioProvider.name[1],
                                      groupValue:
                                          radioProvider.name[selectedIndex],
                                      onChanged: (value) {
                                        radioProvider.setIndex(1);
                                      }),
                                ),
                               const SizedBox(
                                  height: 40,
                                ),
                              ],
                            );
                          });
                    });
              },
              child: Text(radioProvider.name[radioProvider.selectedIndex]),
            ),
          ],
        );
      }),
    );
  }
}

class RadioProvider extends ChangeNotifier {
  List<String> _buttonname = ['Anyone', 'Connection only'];

  List<String> get name => _buttonname;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  String groupValue = 'Anyone';

  setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

 /*  setGroupValue(String value) {
    groupValue = value;
    notifyListeners();
  } */
}
