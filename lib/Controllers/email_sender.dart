import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';

class email_sender{
  void send_email(String email_body, String email_subject, String email_recipients)async{
    final Email email = Email(
      body: email_body,
      subject: email_subject,
      recipients: [email_recipients],
      isHTML: false,
    );
  try {
    await FlutterEmailSender.send(email);
  }
  catch (error){
    Fluttertoast.showToast(msg: "Email not sent");
  }
  finally{
    Fluttertoast.showToast(msg: "Email sent!");
  }
  }
}
