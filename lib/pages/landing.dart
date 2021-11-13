import 'package:flutter/material.dart';
import 'package:flutter_app_api/pages/shared_pref.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter api'),
        ),
        body: ListView(
          children: [
            Container(
              child: ElevatedButton(
                child: Text("Shared Pref"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Shared_PrefPage(),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
