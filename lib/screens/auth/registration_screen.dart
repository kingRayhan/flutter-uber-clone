import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  static const String identity = 'registration_screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Registration Screen'),
      ),
    );
  }
}
