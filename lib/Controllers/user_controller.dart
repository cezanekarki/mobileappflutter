import 'package:admission_system/models/user_model.dart';
import 'package:admission_system/services/userdata_db.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  final userdata = <UserModel>[].obs;

  @override
  void onInit() {
    userdata.bindStream(FirestoreDB().getspecifiedUsers());
    super.onInit();
  }
}