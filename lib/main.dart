import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:social_authentication_flutter_structure/firebase_options.dart' as FBOpt;
import 'package:social_authentication_flutter_structure/screens/HomePage.dart';
import 'package:social_authentication_flutter_structure/screens/LoginPage.dart';

void main() async {

  runApp(SocialAuthenticationFlutter());
}

class SocialAuthenticationFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: AuthWrapper(),
    );
  }
}

// Widget para verificar o estado de autenticação do usuário
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Se o usuário estiver autenticado, exibe a HomePage
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user == null ? LoginPage() : HomePage();
        }

        // Exibe uma tela de carregamento enquanto verifica
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}