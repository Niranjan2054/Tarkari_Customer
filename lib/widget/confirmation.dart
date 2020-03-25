import 'package:flutter/material.dart';


class ConfirmationPage extends StatelessWidget {
  ConfirmationPage({Key key, this.username,this.contact,this.vendor}):super(key:key);
  final String username;
  final String contact;
  final Map vendor;
   // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         title: 'Hello World Demo Application',
         theme: ThemeData(
            primarySwatch: Colors.blue,
         ),
         home: Confirmation(title: 'Confirmation Page'),
      );
   }
}
class Confirmation extends StatelessWidget {
   Confirmation({Key key, this.title}) : super(key: key);
   final String title;

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: Text(this.title),
         ),
         body: Center(
            child:
            Text(
               'Confirmation Page',
            )
         ),
      );
   }
}