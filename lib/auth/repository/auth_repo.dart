import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final auth = FirebaseAuth.instance;

  sigUp({required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  signIn({required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  resetPassword({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
