import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class whatsapp_message{
  void sendmessage_whatsapp(String number) async{
    try {
      await launch("https://wa.me/${number}?text=Hello");
    }
    catch(error){
      Fluttertoast.showToast(msg: "Whatsapp not installed!");
    }
    finally{
      Fluttertoast.showToast(msg: "Message Sent!");
    }
  }
}