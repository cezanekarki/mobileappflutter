import 'package:admission_system/Controllers/authentication_control.dart';
import 'package:admission_system/screens/add_user.dart';
import 'package:admission_system/screens/admissionpage.dart';
import 'package:admission_system/screens/email_templates.dart';
import 'package:admission_system/screens/loginscreen.dart';
import 'package:admission_system/screens/user_settings.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final auth_control ac = auth_control();
  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Admission Page"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => admissionpage()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.email), title: Text("Email Template"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => email_template()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), title: Text("User Settings"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.add), title: Text("Add User"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => add_users()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout), title: Text("Sign Out"),
              onTap: () {
                ac.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdmissionLogin()),);
              },
            ),
          ],
        )
    );

  }
}
