import 'package:admission_system/models/user_model.dart';
import 'package:admission_system/services/userdata_db.dart';
import 'package:get/get.dart';

class userModel extends GetxController {

  final usermodel = <UserModel>[].obs;

  @override
  void onInit() {
    usermodel.bindStream(FirestoreDB().getcurrentuser());
    super.onInit();
  }
}