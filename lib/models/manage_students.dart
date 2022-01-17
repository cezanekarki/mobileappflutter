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
  String? subject;
  String? source;
  String? sub_source;
  String? status;
  String? father_name;
  String? mother_name;

  create_newstudent(name, email, phone_number,whatsapp_number,gender,province,district, channel,subject,source,sub_source,status,father_name,mother_name) {
    var Document = FirebaseFirestore.instance.collection("Student Details").doc();
    Document.set(
   {
      "id":Document.id,
      "Name":name,
      "E-mail":email,
      "Phone Number":phone_number,
      "WhatsApp Number":whatsapp_number,
      "Gender":gender,
      "Province":province,
      "District":district,
      "Channel":channel,
      "Subject":subject,
      "Source":source,
      "Sub-source":sub_source,
      "Status":status,
      "Father-name":father_name,
      "Mother-name":mother_name
    }
    );

  }
  detele_student_details(item){
   DocumentReference documentReference=FirebaseFirestore.instance.collection("Student Details").doc(item);
   documentReference.delete().whenComplete(() => print("Deleted Successfully"));
  }
  update_data(name, email, phone_number,whatsapp_number,gender,province,district, channel,subject,source,sub_source,status,father_name,mother_name,item){
  DocumentReference documentReference=FirebaseFirestore.instance.collection("Student Details").doc(item);
  Map<String, Object?> studentsDetails={
    "Name":name,
    "E-mail":email,
    "Phone Number":phone_number.toString(),
    "WhatsApp Number":whatsapp_number.toString(),
    "Gender":gender,
    "Province":province,
    "District":district,
    "Channel":channel,
    "Subject":subject,
    "Source":source,
    "Sub-source":sub_source,
    "Status":status,
    "Father-name":father_name,
    "Mother-name":mother_name
  };
  documentReference.update(studentsDetails).whenComplete(() => print("Data Updated Successfully"));

}
}