import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_calender/LogInPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _HomeState extends State<Home> {

  Color primaryColor = Color(0xff18203d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      /*appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Sign in"),
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/transparent_logo.png',
            height: 350,
          ),
          SizedBox(
            height: 20,
          ),
          //Texts and Styling of them
          Text(
            'Welcome to funccFORCE !',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          SizedBox(height: 20),
          Text(
            'A women led organisation',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),


          //LoginScreen
          Center(
            child:Container(
               width: 220.0,
               height: 40.0,
            child: RaisedButton(
              elevation: 5.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => LogInPage()));
            },
            color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
            textColor: Colors.white,
          ))
          )
        ],
      ),
    );
  }
}




