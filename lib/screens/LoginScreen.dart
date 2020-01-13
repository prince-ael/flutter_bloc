import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final textfieldBorder =
      BorderSide(width: 16.0, color: Colors.lightBlue.shade50);
  final textfieldBorderRadius = BorderRadius.all(Radius.circular(4));

  Widget verticalSpaceOf(double pixel) => SizedBox(height: pixel);

  Widget horizontalSpaceOf(double pixel) => SizedBox(width: pixel);

  Widget userIdField() => TextField(
        decoration: InputDecoration(
            labelText: "User Id",
            hintText: "Enter your user id",
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
                borderSide: textfieldBorder,
                borderRadius: textfieldBorderRadius)),
      );

  Widget passwordField() => TextField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(
                borderSide: textfieldBorder,
                borderRadius: textfieldBorderRadius)),
      );

  Widget loginButton() {
    var loginButton = ButtonTheme(
        height: 48.0,
        child: FlatButton(
          color: Color(0xff0E4eb0),
          textColor: Colors.white,
          child: Text("LOGIN"),
          onPressed: () {
            print("Login Pressed");
          },
        ));

    return loginButton;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(32.0, 56.0, 32.0, 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            userIdField(),
            verticalSpaceOf(16.0),
            passwordField(),
            verticalSpaceOf(32.0),
            loginButton()
          ],
        ),
      ),
    );
  }
}
