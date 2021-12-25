import 'package:url_launcher/url_launcher.dart';

class makephonecalls{
  late final url;
  void makingPhoneCall(String phonenumber) async {
    url = 'tel:'+phonenumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}