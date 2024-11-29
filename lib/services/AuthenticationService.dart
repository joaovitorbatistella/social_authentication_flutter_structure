import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: "538347695231-sei6jos40pq947ue1p9jf3d51k3a5poh.apps.googleusercontent.com",
  );

  // Método de login com o Google
  Future<User?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // O usuário cancelou o login
        return null;
      }

      // Obtém as credenciais do Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      print(googleAuth);

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Faz a autenticação com o Firebase
      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      return userCredential.user;
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