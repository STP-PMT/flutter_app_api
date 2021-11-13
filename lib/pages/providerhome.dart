import 'package:flutter/material.dart';
import 'package:flutter_app_api/pages/providersecond.dart';
import 'package:flutter_app_api/provider/appdata.dart';
import 'package:provider/src/provider.dart';

class ProviderHomePage extends StatelessWidget {
  const ProviderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          child: Text('Set Provider'),
          onPressed: () {
            UserProfile profile = UserProfile();
            profile.name = "Sithipong";
            profile.id = 1;
            profile.avatar = "image.png";
            profile.bDate = DateTime.now();
            context.read<Appdata>().profile = profile;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProviderSecondPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
