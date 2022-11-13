// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_application/dashboard.dart';
import 'package:hackathon_application/registrationpage.dart';
import 'package:email_validator/email_validator.dart';

class RegistrationPage extends StatefulWidget {
  final Function() onClickedSignIn;

  const RegistrationPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Center(
              child: ListView(
                children: [
                  Container(
                    height: 280.0,
                    width: 320.0,
                    padding: EdgeInsets.only(top: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                      child: Image.asset('assets/smartlogger-logo.png'),
                    ),
                  ),
                  Center(
                    //Hello again
                    child: Text(
                      'Sign Up!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Thanks for Joining Us!',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  //Email Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //password field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(labelText: 'Password'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Enter at least 6 characters'
                                  : null,
                        ),
                      ),
                    ),
                  ),
                  //sign in button
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextButton(
                      onPressed: signUp,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //Not member? REGISTER NOW
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        text: 'Already have an account? ',
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignIn,
                              text: 'Log In',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).colorScheme.secondary,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      // TODO
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Error"),
          content: Text(
              "Error Creating Account (Email may be in use by another Account!)"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
