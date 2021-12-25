import 'package:cloud_firestore/cloud_firestore.dart';

class add_new_students{
  String? name;
  String? email;
  int? phone_number;
  int? whatsapp_number;
  String? gender;
  String? province;
  String? district;
  String? channel;
  String? source;
  String? sub_source;
  String? status;
  String? sub_status;

  create_newstudent() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Student Details").doc(name);

    Map<String, Object?> studentsDetails={
      "Name":name,
      "E-mail":email,
      "Phone Number":phone_number,
      "WhatsApp Number":whatsapp_number,
      "Gender":gender,
      "Province":province,
      "District":district,
      "Channel":channel,
      "Source":source,
      "Sub-source":sub_source,
      "Status":status,
      "Sub-status":sub_status
    };
    documentReference.set(studentsDetails).whenComplete(() => print("Data Stored Successfully"));
  }
  detele_student_details(item){
   DocumentReference documentReference=FirebaseFirestore.instance.collection("Student Details").doc(item);
   documentReference.delete().whenComplete(() => print("Deleted Successfully"));
  }
  update_date(){
  DocumentReference documentReference=FirebaseFirestore.instance.collection("Student Details").doc(name);
  Map<String, Object?> studentsDetails={
    "Name":name,
    "E-mail":email,
    "Phone Number":phone_number.toString(),
    "WhatsApp Number":whatsapp_number.toString(),
    "Gender":gender,
    "Province":province,
    "District":district,
    "Channel":channel,
    "Source":source,
    "Sub-source":sub_source,
    "Status":status,
    "Sub-status":sub_status
  };
  documentReference.update(studentsDetails).whenComplete(() => print("Data Updated Successfully"));

}
}