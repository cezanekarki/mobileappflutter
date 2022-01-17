import 'package:admission_system/models/fetcheemail_data.dart';
import 'package:admission_system/services/emailfirestore_db.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {

  final emailsdata = <Emaildata>[].obs;

  @override
  void onInit() {
    emailsdata.bindStream(FirestoreDB().getAllEmails());
    super.onInit();
  }
}