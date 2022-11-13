import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon_application/loginpage.dart';
import 'registrationpage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickedSignUp: toggle)
      : RegistrationPage(onClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
