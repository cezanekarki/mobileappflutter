import 'package:admission_system/screens/add_user.dart';
import 'package:admission_system/screens/admissionpage.dart';
import 'package:admission_system/screens/email_templates.dart';
import 'package:admission_system/screens/loginscreen.dart';
//import 'package:admission_system/screens/message_template.dart';
import 'package:admission_system/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admission System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const admissionpage(),
    ); 
  }
}

