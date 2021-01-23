import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_calender/calender.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

Color primaryColor = Color(0xff18203d);

class _LogInPageState extends State<LogInPage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

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
                child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[

// HEADING 1

                          Text(
                            'Sign in to funccFORCE',
                            textAlign: TextAlign.center,
                            style:
                            GoogleFonts.openSans(
                                color: Colors.white, fontSize: 28),
                          ),
                          SizedBox(height: 20),

// HEADING 2
                          Text(
                            'Enter your email and password below to continue!',
                            textAlign: TextAlign.center,
                            style:
                            GoogleFonts.openSans(
                                color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 50),

// USER INPUT
                          buildTextField('Email', Icons.account_circle_sharp),
                          SizedBox(height: 30),
                          buildTextField(
                              'Password', Icons.remove_red_eye_rounded),
                          SizedBox(height: 50),

// LOG IN BUTTON
                          Center(
                            child: Container(
                              width: 180,
                              height: 40,
                              child: RaisedButton(
                                elevation: 5.0,
                                onPressed: () {
                                  FirebaseUser firebaseUser;
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                      email: 'xyz@gmail.com', password: '123456')
                                      .then((authResult) {
                                    setState(() {
                                      firebaseUser = authResult.user;
                                    });
                                    print(firebaseUser.email);
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (_) => calender()));
                                  });
                                },
                                color: Colors.pink,
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)
                                ),
                                //textColor: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

// GOOGLE SIGN IN BUTTON

                         isSignIn ?
                         Center(
                                child: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                          backgroundImage: NetworkImage(_user.photoUrl),
                                        ),
                                Text(_user.displayName),
                                OutlineButton(
                                  child: Text("LogOut"),
                                    onPressed: () async {
                                    googleSignout();
                                    }
                               ),]))

                         : Center(
                            child: OutlineButton(
                              child: Text("Sign in with google"),
                              onPressed: () async {
                                handleSignIn();
                              },
                            ),
                          )
                                  ],
                          ),



                          /*MaterialButton(
                            elevation: 0,
                            minWidth: double.maxFinite,
                            height: 50,
                            onPressed: () {
                            },

                            color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.google),
                                SizedBox(width: 10),
                                Text('Sign-in using Google',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ],
                            ),
                            textColor: Colors.white,
                          ),

                          SizedBox(height: 100),

                          _buildFooterLogo(),*/


                    )
                )
            ));
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


  bool isSignIn = false;

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));

    _user = result.user;
    setState(() {
      isSignIn = true;
    });
  }

  Future<void> googleSignout() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = false;
      });
    });
  }

  }




