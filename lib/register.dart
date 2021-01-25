import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_calender/LogInPage.dart';
import 'package:user_calender/calender.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class register extends StatefulWidget {
  final String title = 'Registration';
  @override
  _registerState createState() => _registerState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _success;
String _userEmail;

class _registerState extends State<register> {
  Color primaryColor = Color(0xff18203d);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        //title: Text("Registration"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        //title: Text(widget.title),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
//5
            return FlatButton(
              child: const Text('Sign out'),
              textColor: Theme
                  .of(context)
                  .buttonColor,
              onPressed: () async {
                final FirebaseUser user = await _auth.currentUser();
                if (user == null) {
//6
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                  return;
                }
                await _auth.signOut();
                final String uid = user.uid;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(uid + ' has successfully signed out.'),
                ));
              },
            );
          })
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form( key: _formKey,
            //child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                Text(
                  ' Register now !',
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
                    elevation: 5.0,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _register();
                      }
                    },
                    child: const Text('Submit'),
                    textColor: Colors.white,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(height: 15),

                _buildFooterLogo1(),

                Container(
                  alignment: Alignment.center,
                  child: Text(_success == null
                      ? ''
                      : (_success
                      ?  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => LogInPage()))
                  //'Successfully registered ' + _userEmail
                      : 'Registration failed'),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
    ).user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }
}


  _buildFooterLogo1() {
    return Row(
      children: <Widget>[
            Text(
              "Already have an account?",
              textDirection: TextDirection.ltr,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 15),
            ),
        Expanded(
          child: Text(
            "LogIn",
            textDirection: TextDirection.rtl,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 15),
          ),
        ),
      ],
    );
  }
