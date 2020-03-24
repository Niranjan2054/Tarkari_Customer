import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tarkari_customer/widget/login.dart';
// import 'package:khwopa_app/widget/onboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginFourPage())));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.blue[200], Colors.blue[700]],
          radius: 0.8,
        )),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/tomato.png',width: 100,height: 100,),
                Text('We Serve Vegetable to your Home.',
                    style: TextStyle(fontFamily: 'Lobster'))
              ]),
        ),
      ),
    );
  }
}
