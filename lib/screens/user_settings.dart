import 'dart:ui';
import 'package:admission_system/Controllers/currentuser_controller.dart';
import 'package:admission_system/Controllers/drawer.dart';
import 'package:admission_system/screens/admissionpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';
import "dart:io";

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  @override
  void initState() {
    showdata();
    phonefunc();
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }

  File? _pickedImage;
  String? url;

  void getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }
  User user = FirebaseAuth.instance.currentUser!;
  showdata(){
    print(user.photoURL);
  }
  updatePhoto() async {

    String name;
    String uid;

    name=user.displayName!;
    uid=user.uid;
    /*final ref = FirebaseStorage.instance
        .ref()
        .child('userImages')
        .child(name + uid+ '.jpg');
    await ref.putFile(_pickedImage!);*/
    final ref = FirebaseStorage.instance
        .ref()
        .child('userImages')
        .child(name + uid+ '.jpg');
    UploadTask uploadTask = ref.putFile(_pickedImage!);
    var imageurl=await(await uploadTask).ref.getDownloadURL();
    print(imageurl);
    url= imageurl.toString();
    print(url);
    await user.updatePhotoURL(url);

  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final userController = Get.put(userModel());
  String? email;

  int? phonenumber;
  phonefunc(){
    int a=userController.usermodel.length;
    int i=a-1;
    for (a;a>0;a--){
      phonenumber = userController
          .usermodel[i].phoneNumber!
          .toInt();

    }
    print(phonenumber);
    return phonenumber;
  }

  @override
  Widget build(BuildContext context) {
    email=user.email;
    print(email);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      drawer: MyDrawer(),
      body: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height * 0.800,
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: userController.usermodel.length,

              itemBuilder: (BuildContext context, int index) {
                return Column(

                  children:[

                    GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Column(
                      children: [
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 10))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: (_pickedImage != null)
                                            ? FileImage(File(_pickedImage!.path)) as ImageProvider
                                            : NetworkImage(user.photoURL ?? "") as ImageProvider)),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      color: Colors.green,
                                    ),
                                    child: IconButton(
                                      color: Colors.white,
                                      onPressed: () async {
                                        getImage();
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: Container(
                            child: Text("${userController.usermodel[index].name!.toUpperCase()}",
                            style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.normal,
                            ),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: TextFormField(
                            initialValue:
                                userController.usermodel[index].email.toString(),
                            onChanged: (String newValue) {
                              setState(() {
                                email = newValue;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 10),
                                labelText: "Email ID",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: TextFormField(
                            initialValue: userController
                                .usermodel[index].phoneNumber
                                .toString(),
                            onChanged: (String newValue) {
                              setState(() {
                                phonenumber = (newValue as int?)!;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 10),
                                labelText: "Phone Number",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlineButton(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacement( context, MaterialPageRoute(
                                    builder: (context) => admissionpage()),);
                              },
                              child: Text("CANCEL",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.black)),
                            ),
                            RaisedButton(
                              onPressed: () async{
                                try{
                                  User? user = FirebaseAuth.instance.currentUser!;
                                  print(email);
                                  print(phonenumber);
                                  user.updateEmail(email!);
                                  String userid= user.uid;
                                  FirebaseFirestore.instance.collection('users').doc(userid).update({
                                    "email":email,
                                    "phoneNumber":phonenumber
                                  });
                                  await updatePhoto();
                                }
                                catch (e){
                                  print("error=${e.toString()}");
                                  Fluttertoast.showToast(msg: "Error updating data");
                                }
                                finally{
                                  Fluttertoast.showToast(msg: "Data Updated");
                                }

                              },
                              color: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "SAVE",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]
                );
              }),
        ),
      ),
    );
  }
}
