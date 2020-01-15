import 'package:flutter/material.dart';
import '../block/Bloc.dart';
import '../block/Provider.dart';

class LoginScreen extends StatelessWidget {
  final textfieldBorder =
      BorderSide(width: 16.0, color: Colors.lightBlue.shade50);
  final textfieldBorderRadius = BorderRadius.all(Radius.circular(4));

  void onLogin() {
    print("Login Button Pressed");
  }

  Widget verticalSpaceOf(double pixel) => SizedBox(height: pixel);

  Widget horizontalSpaceOf(double pixel) => SizedBox(width: pixel);

  Widget userIdField(Bloc bloc) => StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "User Id",
                hintText: "Enter your user id",
                prefixIcon: Icon(Icons.person),
                errorText: snapshot.error,
                border: OutlineInputBorder(
                  borderSide: textfieldBorder,
                  borderRadius: textfieldBorderRadius,
                )),
            onChanged: bloc.changeEmail,
          );
        },
      );

  Widget passwordField(Bloc bloc) => StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                prefixIcon: Icon(Icons.lock),
                errorText: snapshot.error,
                border: OutlineInputBorder(
                    borderSide: textfieldBorder,
                    borderRadius: textfieldBorderRadius)),
            onChanged: bloc.changePassword,
          );
        },
      );

  Widget loginButton(Bloc bloc) {
    var loginButton = StreamBuilder(
      stream: bloc.isCredentialValid,
      builder: (context, snapshot) {
        return ButtonTheme(
            height: 48.0,
            child: FlatButton(
              color: Color(0xff0E4eb0),
              textColor: Colors.white,
              child: Text("LOGIN"),
              onPressed: snapshot.hasData ? bloc.login : null,
            ));
      },
    );

    return loginButton;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(32.0, 56.0, 32.0, 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            userIdField(bloc),
            verticalSpaceOf(16.0),
            passwordField(bloc),
            verticalSpaceOf(32.0),
            loginButton(bloc)
          ],
        ),
      ),
    );
  }
}
