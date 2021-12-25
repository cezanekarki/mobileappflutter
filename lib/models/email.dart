import 'package:cloud_firestore/cloud_firestore.dart';

class manage_emails{

  Future<void> create_emails(String title, String subject, String message)async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Email Template").doc(title);
    Map<String, Object?> Email_details={
      "Title":title,
      "Subject":subject,
      "Message":message
    };
    await documentReference.set(Email_details).whenComplete(() => print("Data Stored Successfully"));
  }

  delete_emails(item){
    DocumentReference documentReference=FirebaseFirestore.instance.collection("Email Template").doc(item);
    documentReference.delete().whenComplete(() => print("Deleted Successfully"));
  }

  update_emails(String title,String subject, String message){
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Email Template").doc(title);
    Map<String, Object?> Email_details={
      "Title":title,
      "Subject":subject,
      "Message":message
    };
    documentReference.update(Email_details).whenComplete(() => print("Data Updated Successfully"));
  }
}