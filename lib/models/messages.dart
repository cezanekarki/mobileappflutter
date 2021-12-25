import 'package:cloud_firestore/cloud_firestore.dart';

class manage_messages{

  Future<void> create_messages(String title, String message)async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Message Template").doc(title);
    Map<String, Object?> Message_details={
      "Title":title,
      "Message":message
    };
    await documentReference.set(Message_details).whenComplete(() => print("Data Stored Successfully"));
  }

  delete_messages(item){
    DocumentReference documentReference=FirebaseFirestore.instance.collection("Message Template").doc(item);
    documentReference.delete().whenComplete(() => print("Deleted Successfully"));
  }

  update_messages(String title, String message){
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Message Template").doc(title);
    Map<String, Object?> Message_details={
      "Title":title,
      "Message":message
    };
    documentReference.update(Message_details).whenComplete(() => print("Data Updated Successfully"));
  }
}