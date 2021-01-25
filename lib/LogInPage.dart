import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_calender/calender.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

Color primaryColor = Color(0xff18203d);

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  /*FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();*/

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(
                    ' LogIn !',
                    textAlign: TextAlign.center,
                    style:
                    GoogleFonts.openSans(
                        color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 30),

                  Text(
                    'Enter your email and password below to continue!',
                    textAlign: TextAlign.center,
                    style:
                    GoogleFonts.openSans(
                        color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 48),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    cursorColor: Colors.white,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    cursorColor: Colors.white,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25,),

                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: RaisedButton(
                      elevation: 5.0;,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _signInWithEmailAndPassword();
                        }
                      },
                      child: const Text('Submit'),
                      textColor: Colors.white,
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(height: 15),

                  _buildFooterLogo(),

                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _success == null
                          ? ''
                          : (_success
                          ? Navigator.push(context,
                          MaterialPageRoute(
                              builder: (_) => calender()))
                      //'Successfully signed in ' + _userEmail
                          : 'Sign in failed'),
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }


  void _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }
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






 /* bool isSignIn = false;

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
  }*/






