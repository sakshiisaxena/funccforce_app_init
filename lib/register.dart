import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_calender/LogInPage.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  Color primaryColor = Color(0xff18203d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
        child: Column(
        children: <Widget>[

// HEADING 1

          Text(
          'Become a member',
          textAlign: TextAlign.center,
          style:
          GoogleFonts.openSans(color: Colors.white, fontSize: 28),
          ),
          SizedBox(height: 20),

// HEADING 2
            Text(
            'Enter your details here and register!',
            textAlign: TextAlign.center,
            style:
            GoogleFonts.openSans(color: Colors.white, fontSize: 16),
        ),
          SizedBox(height: 60),

// USER INPUT
            buildTextField('Username', Icons.account_box_rounded),
            SizedBox(height: 30),
            buildTextField('Email', Icons.email_rounded),
            SizedBox(height: 30),
            buildTextField('Enter Password', Icons.remove_red_eye_rounded),
            SizedBox(height: 30),
            buildTextField('Re-enter Password', Icons.remove_red_eye_rounded),
            SizedBox(height: 50),


// REGISTER BUTTON

              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: ()  {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LogInPage()));

                },
                color: Colors.pink,
                child: Text('Register',
                style: TextStyle(color: Colors.white, fontSize: 20)
                ),
                //textColor: Colors.white,
                ),

                SizedBox(height: 50),

          _buildFooterLogo1(),

        ]
        )
    )
    )
    )
    );
  }
  }

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


  _buildFooterLogo1() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Text(
              "Already have an account?",
              textDirection: TextDirection.ltr,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 15),
            )),
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
