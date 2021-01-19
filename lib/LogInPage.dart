import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_calender/Home.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

Color primaryColor = Color(0xff18203d);

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[

// HEADING 1

              Text(
                'Sign in to funccFORCE',
                textAlign: TextAlign.center,
                style:
                GoogleFonts.openSans(color: Colors.white, fontSize: 28),
              ),
              SizedBox(height: 20),

// HEADING 2
              Text(
                'Enter your email and password below to continue!',
                textAlign: TextAlign.center,
                style:
                GoogleFonts.openSans(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 50),

// USER INPUT
              buildTextField('Email', Icons.account_circle_sharp),
              SizedBox(height: 30),
              buildTextField('Password', Icons.remove_red_eye_rounded),
              SizedBox(height: 50),

// LOG IN BUTTON

              Container(
                width: 180,
                height: 40,
                child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () async {
                        User firebaseUser;
                       firebaseAuth.signInWithEmailAndPassword(email: 'xyz@gmail.com', password: '123456').then((authResult) {
                        setState(() {
                          firebaseUser = authResult.user;
                        });
                        print(firebaseUser.email);      //this should print but is not doing so
                       });
                      },
                      color: Colors.pink,
                      child: Text('Login',
                          style: TextStyle(color: Colors.white, fontSize: 20)
                      ),
                      //textColor: Colors.white,
                    ),
              ),
              SizedBox(height: 20),

// GOOGLE SIGN IN BUTTON

              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async {
                  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
                  final GoogleSignInAuthentication googleAuth =
                  await googleUser.authentication;

                  final AuthCredential credential = GoogleAuthProvider.credential(
                      idToken: googleAuth.idToken,
                      accessToken: googleAuth.accessToken);

                  final User user =
                      (await firebaseAuth.signInWithCredential(credential)).user;
                    },


                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google),
                    SizedBox(width: 10),
                    Text('Sign-in using Google',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
                textColor: Colors.white,
              ),
              SizedBox(height: 100),

              _buildFooterLogo(),
            ],
          ),
        ),
      ),
    );
  }


// TEXT FIELD
  buildTextField(String labelText, IconData icon) {
   return TextField(
     decoration: InputDecoration(
         contentPadding: EdgeInsets.symmetric(horizontal: 30),
         labelText: labelText,
         labelStyle: TextStyle(color: Colors.white),
         icon: Icon(
           icon,
           color: Colors.white,
         ),
         // prefix: Icon(icon),
         border: InputBorder.none),
   );
  }

// FOOTER
  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /*Image.asset(
          'assets/route.png',
          height: 50,
        ),*/
        Column(
          children: [
            Text('funccFORCE',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text('a women led organisation',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 15,
                ),)
          ],
      )
      ],
    );
  }


}
