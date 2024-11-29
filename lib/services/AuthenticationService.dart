import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {

  // Método de login com o Google
  Future<User?> loginWithGoogle() async {
    try {
      // implementar lógica

      return null;
    } catch (e) {
      print("Erro ao fazer login com Google: $e");
      return null;
    }
  }

  // Método de logout
  // Future<void> logout() async {
  //   try {
  //     await _auth.signOut();
  //     await _googleSignIn.signOut();
  //   } catch(e) {
  //     return;
  //   }
  // }
}