import 'package:flutter/material.dart';
import 'package:tarkari_customer/component/datatable.dart';

class ConfirmationPage extends StatelessWidget {
  ConfirmationPage({Key key, this.username, this.contact, this.vegetableList})
      : super(key: key);
  final String username;
  final String contact;
  final List vegetableList;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Here");
    return MaterialApp(
      title: 'Online Vegetables',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Confirmation(
        title: 'Confirmation Page',
        username: username,
        contact: contact,
        vegetableList: vegetableList,
      ),
    );
  }
}

class Confirmation extends StatelessWidget {
  Confirmation(
      {Key key, this.title, this.username, this.contact, this.vegetableList})
      : super(key: key);
  final String title;
  final String username;
  final String contact;
  final List vegetableList;
  int total = 0;

  // may be the indexing is the problem
  void calculateTotal() {
    for (var i = 0; i < vegetableList.length; i++) {
      this.total += vegetableList[i]['price'] * vegetableList[i]['quantity'];
      print(this.total);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map> vegs =
        (vegetableList as List).map((itemWord) => Map.of(itemWord)).toList();
    calculateTotal();
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
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Container(
                padding: EdgeInsets.all(6),
                child: DataTableExample(
                  vegetableList: vegs,
                ),
              ),
            ),
            _checkoutSection(context, this.total)
          ],
        ),
      ),
    );
  }
}

Widget CustomRow(title, value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      Text(
        value,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _checkoutSection(BuildContext context, int total) {
  return Material(
    color: Colors.black12,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Checkout Price:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  "Rs. " + total.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            color: Colors.blue,
            elevation: 1.0,
            child: InkWell(
              splashColor: Colors.blueAccent,
              onTap: () {
                // navigateToConfirmation(context,username,contact,vendor);
              },
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
