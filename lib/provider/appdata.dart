import 'package:flutter/material.dart';

class Appdata with ChangeNotifier{
  UserProfile _profile = UserProfile();
  UserProfile get  profile => _profile;
  set profile(UserProfile profile){
    _profile = profile;
  }
}

class UserProfile{
  int id = 0;
  String name = '';
  DateTime bDate = DateTime.now();
  String avatar = '';
}