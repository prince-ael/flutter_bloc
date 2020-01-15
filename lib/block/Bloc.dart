import 'dart:async';
import './Validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get isCredentialValid =>
      Rx.combineLatest2(email, password, (a, b) => true);

  void login() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print("$validEmail\n$validPassword");
  }

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}
