import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admission_system/models/fetcheemail_data.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Emaildata>> getAllEmails() {
    return _firebaseFirestore
        .collection('EmailTemplate')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Emaildata.fromSnapshot(doc)).toList();
    });
  }
}