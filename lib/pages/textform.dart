import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class TextFormPage extends StatefulWidget {
  const TextFormPage({Key? key}) : super(key: key);

  @override
  _TextFormPageState createState() => _TextFormPageState();
}

class _TextFormPageState extends State<TextFormPage> {
  String? validator(String? value, String type) {
    if (value == null || value.isEmpty) {
      return null;
    } else {
      if (type == 'email') {
        if (isEmail(value) == false) {
          return 'Email invalid';
        }
      } else if (type == 'password') {
        if (isLength(value, 8) == false) {
          return 'Password to short';
        }
        if (isAlpha(value)) {
          return 'Number required';
        }
        if (isNumeric(value)) {
          return 'Character required';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Your email',
              labelText: 'Email *',
            ),
            validator: (value) => validator(value, 'email'),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Your password',
              labelText: 'Password *',
            ),
            validator: (value) => validator(value, 'password'),
          )
        ],
      ),
    );
  }
}
