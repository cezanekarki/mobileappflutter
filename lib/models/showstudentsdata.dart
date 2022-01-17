import 'package:cloud_firestore/cloud_firestore.dart';

class Studentdata {
  final String? id;
  final String? name;
  final String? email;
  final String? phone_number;
  final String? whatsapp_number;
  final String? gender;
  final String? province;
  final String? district;
  final String? channel;
  final String? subject;
  final String? source;
  final String? sub_source;
  final String? status;
  final String? father_name;
  final String? mother_name;

  const Studentdata({
    this.id,
    this.name,
    this.email,
    this.phone_number,
    this.whatsapp_number,
    this.gender,
    this.province,
    this.district,
    this.channel,
    this.subject,
    this.source,
    this.sub_source,
    this.status,
    this.father_name,
    this.mother_name
  });

  static Studentdata fromSnapshot(DocumentSnapshot snap) {
    Studentdata studentdata = Studentdata(
      id:snap['id'],
      name: snap['Name'],
      email: snap['E-mail'],
      phone_number: snap['Phone Number'],
      whatsapp_number: snap['WhatsApp Number'],
      gender: snap['Gender'],
      province: snap['Province'],
      district: snap['District'],
      channel: snap['Channel'],
      subject: snap['Subject'],
      source: snap['Source'],
      sub_source: snap['Sub-source'],
      status: snap['Status'],
      father_name: snap['Father-name'],
      mother_name: snap['Mother-name']
    );
    return studentdata;
  }
}