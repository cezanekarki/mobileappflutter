import 'package:cloud_firestore/cloud_firestore.dart';

class Emaildata {
  final String? title;
  final String? subject;
  final String? message;


  const Emaildata({
    this.title,
    this.subject,
    this.message,

  });

  static Emaildata fromSnapshot(DocumentSnapshot snap) {
    Emaildata emaildata = Emaildata(
      title: snap['Title'],
      subject: snap['Subject'],
      message: snap['Message'],

    );
    return emaildata;
  }
}