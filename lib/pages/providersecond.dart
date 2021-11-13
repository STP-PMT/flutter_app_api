import 'package:flutter/material.dart';
import 'package:flutter_app_api/provider/appdata.dart';
import 'package:provider/src/provider.dart';

class ProviderSecondPage extends StatelessWidget {
  const ProviderSecondPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(),
      body: Column(
        children: [
          Text(context.watch<Appdata>().profile.id.toString()),
          Text(context.watch<Appdata>().profile.name.toString()),
          Text(context.watch<Appdata>().profile.avatar.toString()),
          Text(context.watch<Appdata>().profile.bDate.toString()),
        ],
      ),
    );
  }
}