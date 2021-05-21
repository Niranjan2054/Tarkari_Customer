import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tarkari_customer/widget/cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendorList extends StatefulWidget {
  VendorList({Key key, this.username, this.contact}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";
  final String username;
  final String contact;
  _VendorListState createState() =>
      _VendorListState(username: username, contact: contact);
}

class _VendorListState extends State<VendorList> {
  _VendorListState({Key key, this.username, this.contact});
  final String username;
  final String contact;
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final Color primary = Colors.blue;
  final Color secondary = Colors.black;
  final _formKey = GlobalKey<FormState>();
  // final databaseReference = FirebaseDatabase.instance.reference();

  List<Map> VendorLists = [
    {
      "name": "Jagati Alu Pyaj Bhandar",
      "location": "Jagati, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Chayamasingh Aly Pyaj",
      "location": "Chayamasingh, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Jagati Alu Pyaj Bhandar",
      "location": "Jagati, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Jagati Alu Pyaj Bhandar",
      "location": "Jagati, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Chayamasingh Aly Pyaj",
      "location": "Chayamasingh, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Jagati Alu Pyaj Bhandar1",
      "location": "Jagati, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Jagati Alu Pyaj Bhandar",
      "location": "Jagati, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Chayamasingh Aly Pyaj",
      "location": "Chayamasingh, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Jagati Alu Pyaj Bhandar",
      "location": "Jagati, Bhaktapur",
      "contact": "9843******",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
  ];
  bool change = false;
  List<Map> temp;
  QuerySnapshot querySnapshot;

  // void getData(BuildContext context){
  //   print('nepal');

  // }
  @override
  void initState() {
    super.initState();
    getDriversList().then((results) {
      setState(() {
        print('helow');
        querySnapshot = results;
        print(querySnapshot);
      });
    });
  }

  getDriversList() async {
    return await Firestore.instance.collection('vendors').getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    print("How are you");
    // getData(context);
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: (change) ? temp.length : VendorLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (change) {
                        return buildListTemp(
                            context, index, this.username, this.contact);
                      } else {
                        return buildList(
                            context, index, this.username, this.contact);
                      }
                    }),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // IconButton(
                      //   onPressed: () {

                      //   },
                      //   icon: Icon(
                      //     Icons.menu,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Text(
                        "Vendors",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.filter_list,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          key: _formKey,
                          onChanged: (text) {
                            setState(() {
                              change = true;
                              temp = VendorLists.where((vendor) =>
                                  (vendor['name'] +
                                          vendor['location'].toString() +
                                          vendor['contact'].toString())
                                      .toString()
                                      .toLowerCase()
                                      .contains(text.toLowerCase())).toList();
                              print(temp);
                            });
                            ;
                          },
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search Vendor",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(
      BuildContext context, int index, String username, String contact) {
    return FlatButton(
        onPressed: () {
          Navigator.of(context)
              .push(_createRoute(username, contact, VendorLists[index]));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: secondary),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          VendorLists[index]['logoText']),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      VendorLists[index]['name'],
                      style: TextStyle(
                          color: secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(VendorLists[index]['location'],
                            style: TextStyle(
                                color: secondary,
                                fontSize: 13,
                                letterSpacing: .3)),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.contact_phone,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(VendorLists[index]['contact'],
                            style: TextStyle(
                                color: secondary,
                                fontSize: 13,
                                letterSpacing: .3)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget buildListTemp(
      BuildContext context, int index, String username, String contact) {
    return FlatButton(
        onPressed: () {
          Navigator.of(context)
              .push(_createRoute(username, contact, temp[index]));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: secondary),
                  image: DecorationImage(
                      image:
                          CachedNetworkImageProvider(temp[index]['logoText']),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      temp[index]['name'],
                      style: TextStyle(
                          color: secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(temp[index]['location'],
                            style: TextStyle(
                                color: secondary,
                                fontSize: 13,
                                letterSpacing: .3)),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.contact_phone,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(temp[index]['contact'],
                            style: TextStyle(
                                color: secondary,
                                fontSize: 13,
                                letterSpacing: .3)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Route _createRoute(String username, String contact, Map vendor) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Vegetable(
      username: username,
      contact: contact,
      vendor: vendor,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
