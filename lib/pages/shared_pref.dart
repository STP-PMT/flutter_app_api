import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_PrefPage extends StatelessWidget {
  //Shared_PrefPage({Key? key}) : super(key: key);

  TextEditingController ctl = TextEditingController();
  late SharedPreferences prefs;
  Future loadPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadPref(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Text(prefs.getString('userid') ?? 'No Data'),
                TextField(
                  controller: ctl,
                ),
                ElevatedButton(
                  onPressed: () {
                    prefs.setString('userid', ctl.text);
                  },
                  child: Text("Save to pref"),
                ),
              ],
            ),
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
