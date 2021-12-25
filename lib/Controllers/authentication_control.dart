import 'package:admission_system/screens/admissionpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'navigator.dart';


class auth_control extends GetxController{
  //static auth_control instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  String? errorMessage;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signIn(String email, String password) async {
      try {
         await auth
            .signInWithEmailAndPassword(email: email, password: password).then((uid) => {
          Get.to(admissionpage())
         });

      } on FirebaseAuthException catch (error) {
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
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }

    }
}


