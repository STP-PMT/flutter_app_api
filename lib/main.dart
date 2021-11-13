import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_api/pages/landing.dart';
import 'package:flutter_app_api/provider/appdata.dart';
import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Appdata(),
      )
    ],child: const MyApp(),
  ));
}

Future loadConfig() async {
  String value = await rootBundle.loadString("assets/config/config.yaml");
  dynamic conf = loadYaml(value);
  log(conf['url']);
  log(conf['server']['port']);

  // await GlobalConfiguration().loadFromAsset("appconfig");
  // String url = GlobalConfiguration().getValue('url');
  // log(url);
  // String host = GlobalConfiguration().getDeepValue('server:host');
  // log(host);
  // String username = GlobalConfiguration().getDeepValue('login:username');
  // log(username);
  // String password = GlobalConfiguration().getDeepValue('login:password');
  // log(password);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: loadConfig(),
          builder: (context, snapshot) {
            return LandingPage();
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
