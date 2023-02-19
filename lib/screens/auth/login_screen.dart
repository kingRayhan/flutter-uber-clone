import 'package:flutter/material.dart';

import '../../mixins/validator_mixin.dart';

class LoginScreen extends StatefulWidget {
  static const String identity = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidatorMixin {
  final formKey = GlobalKey<FormState>();

  Map<String, dynamic> credentials = {
    'email': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 45.0),
          const Image(
            image: AssetImage("app_assets/images/uber-dark-squire.png"),
            width: double.infinity,
            height: 250.0,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 1.0),
          const Text(
            "Login in as a Rider",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: "Brand Bold",
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppInputField(
                        hintText: 'Your Email Address',
                        labelText: 'Email',
                        validator: emailValidator,
                        onSaved: (value) => credentials['email'] = value,
                      ),
                      const SizedBox(height: 15.0),
                      AppInputField(
                        hintText: 'Password',
                        labelText: 'Password',
                        isPassword: true,
                        validator: passwordValidator,
                        onSaved: (value) => credentials['password'] = value,
                      ),
                      const SizedBox(height: 15.0),
                      AppButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          formKey.currentState!.save();
                          print(credentials);
                          print("Login Button Clicked");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [Text("Login", style: TextStyle(fontSize: 18.0))],
        ),
      ),
    );
  }
}

class AppInputField extends StatelessWidget {
  const AppInputField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.isPassword = false,
    required this.onSaved,
    this.validator,
  });
  final String hintText;
  final String labelText;
  final bool isPassword;
  final Function onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      onSaved: (value) {
        onSaved(value);
      },
      validator: validator,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white60, width: 0.0),
          ),
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(color: Colors.white60),
          labelStyle: const TextStyle(color: Colors.white60)),
    );
  }
}
