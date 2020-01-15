import 'dart:async';

class Validator {
  static void handleEmail(String email, EventSink<String> event) {
    var regExp = RegExp("[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z0-9.-]{1,}");
    if (regExp.hasMatch(email)) {
      event.add(email);
    } else {
      event.addError("Invalid Email");
    }
  }

  static void handlePassword(String password, EventSink<String> event) {
    if (password.length > 4) {
      event.add(password);
    } else {
      event.addError("Password must be at least 5 characters");
    }
  }

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: handleEmail);
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: handlePassword);
}
