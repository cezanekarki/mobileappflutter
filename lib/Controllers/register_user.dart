import 'package:admission_system/models/user_model.dart';
import 'package:admission_system/screens/add_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'navigator.dart';
import 'dart:io';


class reg_user extends GetxController {

  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  final _formKey = GlobalKey<FormState>();


  void signUp(String email, String password, String name, int phone) async {
    FirebaseApp app = await Firebase.initializeApp(
        name: 'Secondary', options: Firebase.app().options);
      try {
          var userAuth = FirebaseAuth.instanceFor(app: app);
            await userAuth.createUserWithEmailAndPassword(email: email, password: password)
            .then((value) async => {
              print("Hello userid:${userAuth.currentUser!.uid}"),
              await postDetailsToFirestore(name, phone,userAuth.currentUser!.uid,userAuth.currentUser),
              //uploadFile(name,userAuth.currentUser!.uid,userAuth.currentUser),
              await app.delete(),
            });

      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }

  }

  postDetailsToFirestore(String name, int phone, String userid,user) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    //print("User: $user");
    print("User id:$userid");
    //User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    user.updateDisplayName(name);
    // writing all the values
    userModel.email = user.email;
    userModel.uid = userid;
    userModel.name = name;
    userModel.phoneNumber = phone;
    userModel.userRole="User";

    await firebaseFirestore
        .collection("users")
        .doc(userid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
    NavigationService().navigateToScreen(const add_users());
  }

   /*uploadFile(name,user,currentuser) async{

    File image =File("assets/images/userimage.png");
    *//*String downloadURL;
    User? user = _auth.currentUser;
    String filePath = "userImages";
    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(image).onComplete;
    });
    var imageUrl = await (await
        _uploadTask.onComplete).ref.getDownloadURL();
    downloadURL = imageUrl.toString();

    uploadToFirebase(downloadURL);
    return downloadURL;*//*
    var url;
    Future<File> imagefile = File("assets/images/userimage.png").create();
    final ref = FirebaseStorage.instance
        .ref()
        .child('userImages')
        .child(name + user+ '.jpg');
    UploadTask uploadTask = ref.putFile(imagefile as File);
    print(uploadTask);
    var imageurl=await(await uploadTask).ref.getDownloadURL();
    print(imageurl);
    url= imageurl.toString();
    print(url);
    await currentuser.updatePhotoURL(url);
  }*/
}
