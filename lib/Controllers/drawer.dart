import 'package:admission_system/Controllers/authentication_control.dart';
import 'package:admission_system/Controllers/user_controller.dart';
import 'package:admission_system/screens/add_user.dart';
import 'package:admission_system/screens/admissionpage.dart';
import 'package:admission_system/screens/email_templates.dart';
import 'package:admission_system/screens/loginscreen.dart';
import 'package:admission_system/screens/passwordchanger_screen.dart';
import 'package:admission_system/screens/user_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final auth_control ac = auth_control();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String myId = '';
  String? myUsername='';
  String myEmailid = '';
  String userrole = '';
  late bool showdrawervalue;
  final userdatacontroller =Get.put(UserController());

  User? user = FirebaseAuth.instance.currentUser!;
  void initstate() {
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
                FutureBuilder(
                  future: _getdata(),
                  builder:(
                      BuildContext context,
                      AsyncSnapshot<String> snapshot,
                  ) {
                    return ListView(
                      // Important: Remove any padding from the ListView.
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          UserAccountsDrawerHeader(
                            accountName: Text(user!.displayName ?? ""),
                            accountEmail: Text(user!.email ?? ""),
                            currentAccountPicture: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: Text(
                                "A",
                                style: TextStyle(fontSize: 40.0),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text("Admission Page"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => admissionpage()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email Template"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => email_template()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("User Settings"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()),
                              );
                            },
                          ),
                          Visibility(
                            visible: showdrawervalue,
                            child: ListTile(
                              leading: Icon(Icons.add),
                              title: Text("Add User"),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      add_users()),
                                );
                              },
                            ),
                          ),
                          Visibility(
                            visible: showdrawervalue,
                            child: ListTile(
                              leading: Icon(Icons.account_circle_sharp ),
                              title: Text("Show Users"),
                              /*onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      add_users()),
                                );
                              },*/
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.security),
                            title: Text("Change Password"),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return passwordChange();
                                  });
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.logout),
                            title: Text("Sign Out"),
                            onTap: () {
                              ac.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => AdmissionLogin()),
                                      (route) => false);
                            },
                          ),
                        ]
                    );
                  }
    )
                );


              }






  _getdata() {
    User? user = _firebaseAuth.currentUser;
     FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .listen((userData) {
      setState(() {
        myId = userData.data()!['uid'];
        myUsername = userData.data()!['name'];
        myEmailid = userData.data()!['email'];
        userrole = userData.data()!['userRole'];
      });
    });
    if (userrole == "User") {
      if (mounted) {
        setState(() {
          showdrawervalue = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          showdrawervalue = true;
        });
      }
    }
  }
}
