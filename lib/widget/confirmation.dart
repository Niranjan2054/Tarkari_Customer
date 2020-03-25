import 'package:flutter/material.dart';
import 'package:tarkari_customer/widget/datatable.dart';


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
         home: Confirmation(title: 'Confirmation Page',username: username,contact: contact,vendor: vendor,),
      );
   }
}
class Confirmation extends StatelessWidget {
   Confirmation({Key key, this.title,this.username,this.contact,this.vendor}) : super(key: key);
   final String title;
   final String username;
   final String contact;
   final Map vendor;

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: Text(this.title),
         ),
         body: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(7),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CustomRow('Name   : ', this.username),
                            CustomRow('Contact: ', this.contact),
                            CustomRow('Vendor : ', this.vendor['name']),
                            CustomRow('Vendor Address: ', this.vendor['location']),
                            CustomRow('Vendor Contact : ', this.vendor['contact']),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: DataTableExample(),
                      ),
                    ),
                  ),
                ],
              ),
         ),
      );
   }
}

Widget CustomRow(title,value){
  return  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(title,style: TextStyle(fontSize: 16),),
              Text(value,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
            ],
          );
}