import 'package:admission_system/models/manage_students.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class studentdataEdit extends StatefulWidget {
  const studentdataEdit({Key? key}) : super(key: key);

  @override
  _studentdataEditState createState() => _studentdataEditState();
}

class _studentdataEditState extends State<studentdataEdit> {
  String name = Get.arguments.name.toString();
  String email = Get.arguments.email.toString();
  String phone_number = Get.arguments.phone_number.toString();
  String whatsapp_number = Get.arguments.whatsapp_number.toString();
  String gender = Get.arguments.gender.toString();
  String province = Get.arguments.province.toString();
  String district = Get.arguments.district.toString();
  String channel = Get.arguments.channel.toString();
  String subject = Get.arguments.subject.toString();
  String source = Get.arguments.source.toString();
  String sub_source = Get.arguments.sub_source.toString();
  String status = Get.arguments.status.toString();
  String father_name = Get.arguments.father_name.toString();
  String mother_name = Get.arguments.mother_name.toString();

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
      DropdownMenuItem(child: Text("Not Connected"), value: "Not Connected"),
      DropdownMenuItem(child: Text("Connected"), value: "Connected"),
      DropdownMenuItem(
          child: Text("Admission Taken"), value: "Admission Taken"),
      DropdownMenuItem(
          child: Text("Pre Admission Taken"), value: "Pre Admission Taken"),
      DropdownMenuItem(child: Text("Follow Up"), value: "Follow Up"),
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

  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Students Data"),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.750,
            width: MediaQuery.of(context).size.width,
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
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: name,
                          onChanged: (String? newValue) {
                            setState(() {
                              name = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: email,
                          onChanged: (String? newValue) {
                            setState(() {
                              email = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 10, top: 3),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            isDense: false,
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: Colors.blueAccent,
                            value: gender,
                            onChanged: (String? newValue) {
                              setState(() {
                                gender = newValue!;
                              });
                            },
                            items: dropdownItems),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Subject",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 10, top: 3),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            isDense: false,
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: Colors.blueAccent,
                            value: subject,
                            onChanged: (String? newValue) {
                              setState(() {
                                subject = newValue!;
                              });
                            },
                            items: subjectItems),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: phone_number,
                          onChanged: (String? newValue) {
                            setState(() {
                              phone_number = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Father's Name",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: father_name,
                          onChanged: (String? newValue) {
                            setState(() {
                              father_name = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Mother's Name",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: mother_name,
                          onChanged: (String? newValue) {
                            setState(() {
                              mother_name = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Whatsapp Number",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: whatsapp_number,
                          onChanged: (String? newValue) {
                            setState(() {
                              whatsapp_number = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Channel",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: channel,
                          onChanged: (String? newValue) {
                            setState(() {
                              channel = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Status",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 10, top: 3),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            isDense: false,
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: Colors.blueAccent,
                            value: status,
                            onChanged: (String? newValue) {
                              setState(() {
                                status = newValue!;
                              });
                            },
                            items: statusItems),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Source",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: source,
                          onChanged: (String? newValue) {
                            setState(() {
                              source = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Sub source",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: sub_source,
                          onChanged: (String? newValue) {
                            setState(() {
                              sub_source = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Province",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 10, top: 3),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            isDense: false,
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: Colors.blueAccent,
                            value: province,
                            onChanged: (String? newValue) {
                              setState(() {
                                province = newValue!;
                              });
                            },
                            items: provinceItems),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 90,
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "District",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.500,
                        margin: const EdgeInsets.only(left: 7, top: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueGrey,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextFormField(
                          initialValue: district,
                          onChanged: (String? newValue) {
                            setState(() {
                              district = newValue!;
                            });
                          },
                          /*onSaved: (input) => value = input!,*/
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            /*icon: Icon(
                              Icons.,
                              color: Color(0xff6dd5fa),
                            ),*/
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      add_new_students().update_data(
                          name,
                          email,
                          phone_number,
                          whatsapp_number,
                          gender,
                          province,
                          district,
                          channel,
                          subject,
                          source,
                          sub_source,
                          status,
                          father_name,
                          mother_name,
                          Get.arguments.id);
                      Fluttertoast.showToast(msg: "Data updated successfully!");
                      Navigator.pop(context);
                    } catch (e) {
                      Fluttertoast.showToast(msg: "Error updating data!");
                    }
                  },
                  child: const Text("Update"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
