import 'package:flutter/material.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () async {
            // implementar lógica aqui
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("google.png"), width: 24),
              SizedBox(width: 10),
              Text("Entrar com Google", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}