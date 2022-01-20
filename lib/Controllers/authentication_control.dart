import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';



class auth_control{
  //static auth_control instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  String? errorMessage;
  get user => auth.currentUser;

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future signIn({required String email, required String password}) async {
      try {
         await auth
            .signInWithEmailAndPassword(email: email, password: password);
         return null;
      } on FirebaseAuthException catch (error) {
        //return error.message;
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            print(errorMessage);
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            print(errorMessage);
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            print(errorMessage);
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            print(errorMessage);
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            print(errorMessage);
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            print(errorMessage);
            break;
          default:
            errorMessage = "An undefined Error happened.";
            print(errorMessage);
        }
        print(error.code);
        return errorMessage!;
        Fluttertoast.showToast(msg: errorMessage!);

      }

    }
}


