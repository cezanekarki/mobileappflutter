import 'package:admission_system/models/manage_students.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class studentsData extends StatefulWidget {
  const studentsData({Key? key}) : super(key: key);

  @override
  _studentsDataState createState() => _studentsDataState();
}

class _studentsDataState extends State<studentsData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Students Data"),
      ),
      body:Column(
        children: [
          Container(
            height: 575,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            margin: const EdgeInsets.only(
                left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20,
                right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 40),
                    padding: const EdgeInsets.only(
                        right: 40),
                    alignment: Alignment.topLeft,

                    child: Text("Name:  ${Get.arguments.name.toString()}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("E-Mail:  ${Get.arguments.email.toString()}",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Phone Number:  ${Get.arguments.phone_number.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Father's Name:  ${Get.arguments.father_name.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Mother's Name:  ${Get.arguments.mother_name.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Whatsapp Number:  ${Get.arguments.whatsapp_number.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Gender:  ${Get.arguments.gender.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Province:  ${Get.arguments.province.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("District:  ${Get.arguments.district.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Channel:  ${Get.arguments.channel.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Subject:  ${Get.arguments.subject.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Status:  ${Get.arguments.status.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Source:  ${Get.arguments.source.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30),

                    alignment: Alignment.topLeft,
                    child: Text("Sub Source:  ${Get.arguments.sub_source.toString()}"
                      ,style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),

                ],
              ),

            ),
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: const EdgeInsets.all(17.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    onPrimary: Colors.white,
                    shadowColor: Colors.blueGrey,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    minimumSize: const Size(150, 50),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    onPrimary: Colors.white,
                    shadowColor: Colors.blueGrey,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    minimumSize: const Size(150, 50),
                  ),
                  onPressed: () {
                    try {
                      add_new_students().detele_student_details(Get.arguments.id);
                      Fluttertoast.showToast(msg: "Data deleted successfully!");
                      Navigator.pop(context);
                    }
                    catch (e){
                      Fluttertoast.showToast(msg: "Error deleting data!");
                    }
                  },
                  child: const Text("Delete"),
                ),
              ),
            ],
          ),
        ],

      ),




    );
  }
}
