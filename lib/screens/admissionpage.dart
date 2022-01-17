import 'package:admission_system/Controllers/drawer.dart';
import 'package:admission_system/Controllers/phone_call.dart';
import 'package:admission_system/Controllers/studentdata_controller.dart';
import 'package:admission_system/models/manage_students.dart';
import 'package:admission_system/screens/selectemail.dart';
import 'package:admission_system/screens/studentdata_edit.dart';
import 'package:admission_system/screens/students_data.dart';
import 'package:admission_system/services/studentsfirebase_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class admissionpage extends StatefulWidget {
  const admissionpage({Key? key}) : super(key: key);

  @override
  _admissionpageState createState() => _admissionpageState();
}

class _admissionpageState extends State<admissionpage> {
  final studentController = Get.put(StudentController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final whatsappController = TextEditingController();
  final districtController = TextEditingController();
  final channelController = TextEditingController();
  final sourceController = TextEditingController();
  final subSource = TextEditingController();
  final fatherController = TextEditingController();
  final motherController = TextEditingController();
  String? selectedValue;
  String? provinceValue;
  String? subjectValue;
  String? statusValue;
  final _dropdownFormKey = GlobalKey<FormState>();

  final db = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Student Details');
  late final int index;
 var menuItems = <String>[
   'All','New','Admission Taken', 'Pre Admission', 'Not Admitted',
 ];

   onSelect(item) {
    int? displayData = studentController.studentsData.length;
    switch (item) {
      case 'All':
        setState(() { displayData = studentController.nonquerieddata(); });
        break;
      case 'New':
        setState(() { displayData = studentController.displayData("New"); });
        break;
      case 'Admission Taken':
        setState(() { displayData = studentController.displayData("Admission Taken"); });
        break;
      case 'Pre Admission':
        setState(() { displayData = studentController.displayData("Pre Admission Taken"); });
        break;
      case 'Not Admitted':
        setState(() { displayData = studentController.displayData("Not Admitted"); });
        break;

    }
    print(displayData);
    return displayData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admission Page"),
          actions: <Widget>[
            PopupMenuButton<String>(
                onSelected: onSelect,
                itemBuilder: (BuildContext context) {
                  return menuItems.map((String choice) {
                    return PopupMenuItem<String>(
                      child: Text(choice),
                      value: choice,
                    );
                  }).toList();
                })
          ],
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _showData(context);
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
            child: Obx(() =>
                Container(

                height: MediaQuery.of(context).size.height * 0.895,
                child: studentdataview(onSelect(menuItems)),
            )
            )
        )
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
      DropdownMenuItem(child: Text("Others"), value: "Others"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get provinceItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1"), value: "1"),
      DropdownMenuItem(child: Text("2"), value: "2"),
      DropdownMenuItem(child: Text("3"), value: "3"),
      DropdownMenuItem(child: Text("4"), value: "4"),
      DropdownMenuItem(child: Text("5"), value: "5"),
      DropdownMenuItem(child: Text("6"), value: "6"),
      DropdownMenuItem(child: Text("7"), value: "7"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get statusItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("New"), value: "New"),
      DropdownMenuItem(child: Text("Not Admitted"), value: "Not Admitted"),
      DropdownMenuItem(
          child: Text("Admission Taken"), value: "Admission Taken"),
      DropdownMenuItem(
          child: Text("Pre Admission Taken"), value: "Pre Admission Taken"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get subjectItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Bsc.(Hons) CS&SE"), value: "Bsc.(Hons) CS&SE"),
      DropdownMenuItem(
          child: Text("Bsc.(Hons) CS&SE TopUp"),
          value: "Bsc.(Hons) CS&SE TopUp"),
      DropdownMenuItem(child: Text("BBA"), value: "BBA"),
    ];
    return menuItems;
  }
  Widget studentdataview(int itemquery){
     if (onSelect(menuItems)== null || onSelect(menuItems)== 0 ){
       return Container(
         alignment: Alignment.center,
         child: Text("No data found!",style:
           TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 25,
             fontStyle: FontStyle.italic
           ),),
       );
     }
     else {
       return ListView.builder(
           itemCount: itemquery,
           itemBuilder: (BuildContext context, int index) {
             return Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     margin: const EdgeInsets.only(
                         left: 20, right: 20, top: 20),
                     padding:
                     const EdgeInsets.only(left: 20, right: 20),
                      height: MediaQuery.of(context).size.height * 0.390,
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
                     child: Column(
                       children: <Widget>[
                         Row(
                           mainAxisAlignment:
                           MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                               margin: const EdgeInsets.only(top: 10),
                               child: Text(
                                 "Name: ${studentController.studentsData[index]
                                     .name}",
                                 style: TextStyle(
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Container(
                               margin: const EdgeInsets.only(top: 10),
                               child: IconButton(
                                 onPressed: () {
                                   try {
                                     makephonecalls().makingPhoneCall(
                                         studentController
                                             .studentsData[index]
                                             .phone_number
                                             .toString());
                                     Fluttertoast.showToast(
                                         msg: "Calling!");
                                   } catch (e) {
                                     Fluttertoast.showToast(
                                         msg: "Cannot make calls");
                                   }
                                 },
                                 icon: Icon(
                                   Icons.phone,
                                   color: Colors.greenAccent,
                                 ),
                               ),
                             )
                           ],
                         ),
                         Row(
                           mainAxisAlignment:
                           MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                               child: Text(
                                 "Gender: ${studentController
                                     .studentsData[index].gender}",
                                 style: TextStyle(
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                             Container(
                               child: IconButton(
                                 onPressed: () {
                                   Get.to(selectemail(),
                                       arguments: studentController
                                           .studentsData[index]);
                                 },
                                 icon: Icon(
                                   Icons.email,
                                   color: Colors.redAccent,
                                 ),
                               ),
                             ),
                           ],
                         ),
                         Container(
                           margin: const EdgeInsets.only(top: 15),
                           alignment: Alignment.topLeft,
                           child: Text(
                             "Subject: ${studentController.studentsData[index]
                                 .subject}",
                             style: TextStyle(
                               fontSize: 20,
                             ),
                           ),
                         ),
                         Container(
                           margin: const EdgeInsets.only(top: 25),
                           alignment: Alignment.topLeft,
                           child: Text(
                             "Status: ${studentController.studentsData[index]
                                 .status}",
                             style: TextStyle(
                               fontSize: 20,
                             ),
                           ),
                         ),
                         Align(
                             alignment: Alignment.bottomCenter,
                             child: Row(
                               mainAxisAlignment:
                               MainAxisAlignment.spaceBetween,
                               children: [
                                 Container(
                                     margin: const EdgeInsets.only(
                                         top: 30),
                                     child: ElevatedButton(
                                         onPressed: () {
                                           Get.to(studentsData(),
                                               arguments: studentController
                                                   .studentsData[index]);
                                         },
                                         child: Text("View Details"))),
                                 Container(
                                   margin:
                                   const EdgeInsets.only(top: 30),
                                   child: IconButton(
                                     onPressed: () {
                                       Get.to(studentdataEdit(),
                                           arguments: studentController
                                               .studentsData[index]);
                                     },
                                     icon: Icon(
                                       Icons.edit,
                                       color: Colors.blueGrey,
                                     ),
                                   ),
                                 )
                               ],
                             ))
                       ],
                     ),
                   ),
                 ),
               ],
             );
           }
       );
     }
  }
  Widget _showData(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text("Add Student Details"),
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            width: 400,
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "Name"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "Email"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: phonenumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "Phone Number"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: whatsappController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "WhatsApp Number"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: "Select gender",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.blueAccent,
                      ),
                      validator: (value) =>
                          value == null ? "Select a gender" : null,
                      dropdownColor: Colors.blueAccent,
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: "Select Province",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.blueAccent,
                      ),
                      validator: (value) =>
                          value == null ? "Select province" : null,
                      dropdownColor: Colors.blueAccent,
                      value: provinceValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          provinceValue = newValue!;
                        });
                      },
                      items: provinceItems),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: districtController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "District"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: channelController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "Channel"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: sourceController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "Source"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: subSource,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "Sub Source"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: "Select Subject",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.blueAccent,
                    ),
                    validator: (value) =>
                        value == null ? "Select a Subject" : null,
                    dropdownColor: Colors.blueAccent,
                    value: subjectValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        subjectValue = newValue!;
                      });
                    },
                    items: subjectItems,
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: "Select Status",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.blueAccent,
                    ),
                    validator: (value) =>
                        value == null ? "Select a Status" : null,
                    dropdownColor: Colors.blueAccent,
                    value: statusValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        statusValue = newValue!;
                      });
                    },
                    items: statusItems,
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: fatherController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "Father Name"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      controller: motherController,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: "Mother Name"),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                ],
              ),
            )),
      ),
      actions: <Widget>[
        FlatButton(
          child: new Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
            onPressed: () {
              try {
                add_new_students().create_newstudent(
                    nameController.text,
                    emailController.text,
                    phonenumberController.text,
                    whatsappController.text,
                    selectedValue,
                    provinceValue,
                    districtController.text,
                    channelController.text,
                    subjectValue,
                    sourceController.text,
                    subSource.text,
                    statusValue,
                    fatherController.text,
                    motherController.text);
                Fluttertoast.showToast(msg: "Added successfully!");
                Navigator.of(context, rootNavigator: true).pop();
              } catch (e) {
                Fluttertoast.showToast(msg: "Unable to add new student");
                print("Error Code:$e");
              }
            },
            child: const Text("Add"))
      ],
    );
  }
}
