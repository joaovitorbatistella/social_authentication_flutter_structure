import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("Unauthenticated.");
      Future.microtask(() {
        Navigator.of(context).pushReplacementNamed('/');
      });
      return Scaffold(); // Retorna uma tela vazia temporária
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem-vindo, ${user?.displayName ?? 'Usuário'}!"),
            SizedBox(height: 16),
            Text("Email: ${user?.email ?? 'Email não encontrado'}"),
            if (user?.photoURL != null) Image.network(user!.photoURL!),
          ],
        ),
      ),
    );
  }
}