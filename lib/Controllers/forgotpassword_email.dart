import 'package:firebase_auth/firebase_auth.dart';

class resetPassword{
  FirebaseAuth auth = FirebaseAuth.instance;
  Future passwordReseter(String email) async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (error){
      return error.message!;
    }
  }
}