import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tarkari_customer/widget/assets.dart';
import 'package:tarkari_customer/widget/list.dart';

class LoginFourPage extends StatelessWidget {
  static final String path = "widget/login.dart";
  final String background = loginBack;
  final _formkey = GlobalKey<FormState>();
  final username = TextEditingController();
  final contact = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(background),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.black.withOpacity(0.7),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: 150.0,),
                      Text("Welcome", style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0
                      ),),
                      Text("Sign in to continue", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0
                      ),),
                      SizedBox(height: 70.0,),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: username,
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Please enter username';
                                }else{
                                  return null;
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.white70),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54))
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            TextFormField(
                              controller: contact,
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Please enter contact number';
                                }else{
                                  if(value.length != 10 && value.length!=7){
                                    return 'Contact is 10 or 7 digit';
                                  }
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Contact Number",
                                hintStyle: TextStyle(color: Colors.white70),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54))
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20.0,),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                child: Text("Sign In".toUpperCase()),
                                onPressed: (){
                                  print(username.text+" \n"+contact.text);
                                  navigateToList(context,username.text,contact.text);                                  
                                },
                              ),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future navigateToList(context,username,contact) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => VendorList(username: username,contact: contact,)));
}