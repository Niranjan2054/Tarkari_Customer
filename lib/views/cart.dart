import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tarkari_customer/component/rounded_bordered_container.dart';
import 'package:tarkari_customer/component/assets.dart';
import 'package:tarkari_customer/views/confirmation.dart';
import 'package:tarkari_customer/process/Storage.dart';
import 'dart:convert';

class Vegetable extends StatefulWidget {
  Vegetable({Key key, this.username, this.contact}) : super(key: key);
  final String username;
  final String contact;
  @override
  _VegetableState createState() => _VegetableState();
}

class _VegetableState extends State<Vegetable> {
  // final List<Map> vegetableLists = [
  //   {
  //     "name": 'Tomato',
  //     "price": 100,
  //     "image": 'assets/tomato.png',
  //     'quantity': 0,
  //   },
  //   {
  //     "name": 'Potato',
  //     "price": 100,
  //     "image": 'assets/tomato.png',
  //     'quantity': 0,
  //   },
  //   {
  //     "name": 'Brinjal',
  //     "price": 10,
  //     "image": 'assets/tomato.png',
  //     'quantity': 0,
  //   },
  //   {
  //     "name": 'CauliFlower',
  //     "price": 100,
  //     "image": 'assets/tomato.png',
  //     'quantity': 0,
  //   },
  //   {
  //     "name": 'Cabbage',
  //     "price": 100,
  //     "image": 'assets/tomato.png',
  //     'quantity': 0,
  //   },
  // ];
  // Get the vegetable stored before --start
  Storage storage;
  List vegetableLists;
  int length = 0;
  void getData() async {
    storage = new Storage('vegetable');
    storage.readData().then((String value) {
      setState(() {
        this.vegetableLists = json.decode(value);
        print(this.vegetableLists);
        this.length = vegetableLists.length;
      });
    });
  }
  // Get the vegetable stored before --end

  int total = 0;
  void calculateTotal() {
    this.total = 0;
    for (var i = 0; i < vegetableLists.length; i++) {
      this.total += vegetableLists[i]['price'] * vegetableLists[i]['quantity'];
      print(this.total);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: vegetableLists.length,
                itemBuilder: (context, int index) {
                  return cartItems(index);
                },
              ),
            ),
            _checkoutSection(context, total)
          ],
        ));
  }

  Widget cartItems(int index) {
    return RoundedContainer(
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      height: 130,
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: CachedNetworkImageProvider(images[1]),
              fit: BoxFit.cover,
            )),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          vegetableLists[index]['name'].toString(),
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Price: "),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Rs. ' + vegetableLists[index]["price"].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Sub Total: "),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                          'Rs. ' +
                              (vegetableLists[index]["price"] *
                                      vegetableLists[index]['quantity'])
                                  .toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.orange,
                          ))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Shipment",
                        style: TextStyle(color: Colors.orange),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (vegetableLists[index]['quantity'] > 0) {
                                  vegetableLists[index]['quantity'] -= 1;
                                  calculateTotal();
                                  print(vegetableLists);
                                }
                              });
                            },
                            splashColor: Colors.redAccent.shade200,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  vegetableLists[index]['quantity'].toString()),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                vegetableLists[index]['quantity'] += 1;
                                calculateTotal();
                                print(vegetableLists);
                              });
                            },
                            splashColor: Colors.lightBlue,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
                splashColor: Colors.redAccent,
                onTap: () {
                  navigateToConfirmation(
                      context, widget.username, widget.contact, vegetableLists);
                },
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Checkout",
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
}

Future navigateToConfirmation(
    context, username, contact, List vegetableLists) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ConfirmationPage(
        username: username,
        contact: contact,
        vegetableList: vegetableLists,
      ),
    ),
  );
}
