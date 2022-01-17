import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? name;
  int? phoneNumber;
  String? userRole;

  UserModel({this.uid, this.email, this.name, this.phoneNumber,this.userRole});

  // receiving data from server
  static UserModel fromSnapshot(DocumentSnapshot snap) {
    UserModel usermodel = UserModel(
      uid: snap['uid'],
      email: snap['email'],
      name: snap['name'],
      phoneNumber: snap['phoneNumber'],
      userRole: snap['userRole'],
    );
    return usermodel;
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'userRole':userRole,
    };
  }
}