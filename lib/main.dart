import 'package:flutter/material.dart';
import 'package:tarkari_customer/views/SplashScreen.dart';
import 'package:tarkari_customer/process/APIRequeset.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  APIRequest apiRequest1 = new APIRequest(
      st: 'vegetable',
      apiUrl:
          'https://raw.githubusercontent.com/Niranjan2054/Tarkari_Customer/master/data/veg.php');
  @override
  Widget build(BuildContext context) {
    apiRequest1.getData();
    return MaterialApp(
      title: 'Online Vegetables',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
