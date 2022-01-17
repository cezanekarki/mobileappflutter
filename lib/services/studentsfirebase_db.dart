import 'package:admission_system/models/showstudentsdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Firestore {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Studentdata>> getallStudents() {
    return _firebaseFirestore
        .collection('Student Details')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Studentdata.fromSnapshot(doc)).toList();
    });
  }
  Stream<List<Studentdata>> getqueriedStudents(data) {
    return _firebaseFirestore
        .collection('Student Details')
        .where("Status", isEqualTo:data)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Studentdata.fromSnapshot(doc)).toList();
    }
    );
  }
}