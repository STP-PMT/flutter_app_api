import 'package:flutter/material.dart';
import 'package:flutter_app_api/pages/httphome.dart';
import 'package:flutter_app_api/pages/providerhome.dart';
import 'package:flutter_app_api/pages/shared_pref.dart';
import 'package:flutter_app_api/provider/appdata.dart';

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
            ),
             Container(
              child: ElevatedButton(
                child: Text("Provider"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProviderHomePage(),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text("Http"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HttpHomePage(),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text("Http with provider"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HttpHomePage(),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
