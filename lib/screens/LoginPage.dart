import 'package:flutter/material.dart';
import 'package:social_authentication_flutter_structure/components/GoogleLoginButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Opacity(
                opacity: 0.4,
                child: Icon(
                    Icons.person_outline,
                    size: 100,
                    color: Colors.redAccent
                ),
              ),
              GoogleLoginButton()
            ],
          )
      ),
    );
  }
}