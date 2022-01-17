import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admission_system/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<List<UserModel>> getspecifiedUsers() {
    return _firebaseFirestore
        .collection('users')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
    });
  }
}