import 'package:flutter/material.dart';
// import 'package:khwopa_app/widget/onboard.dart';
// import 'package:khwopa_app/widget/home.dart';
// import 'package:khwopa_app/widget/department.dart';
// import 'package:khwopa_app/widget/mis.dart';
import 'package:tarkari_customer/widget/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khwopa College of Engineering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // routes: <String, WidgetBuilder>{
      //   '/home': (BuildContext context) => Home(),
      //   '/department': (BuildContext context) => Department(),
      //   '/mis': (BuildContext context) => Mis(),
      // },
    );
  }
}
