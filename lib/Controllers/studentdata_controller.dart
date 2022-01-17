import 'package:admission_system/models/showstudentsdata.dart';
import 'package:admission_system/services/studentsfirebase_db.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {

  final studentsData = <Studentdata>[].obs;

  @override
  void onInit() {
    studentsData.bindStream(Firestore().getallStudents());
    super.onInit();
  }
   displayData(data){
    studentsData.bindStream(Firestore().getqueriedStudents(data));
  }
  nonquerieddata(){
    studentsData.bindStream(Firestore().getallStudents());
  }
}