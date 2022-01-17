import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';


class makephonecalls{
  late final url;
  void makingPhoneCall(String phonenumber) async {
    try {
      await FlutterPhoneDirectCaller.callNumber(phonenumber);
    }
    catch (e){
      print("Error is $e");
    }
  }
}