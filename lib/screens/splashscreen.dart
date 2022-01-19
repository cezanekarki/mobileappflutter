import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'admissionpage.dart';
import 'loginscreen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timeController();
  }
  void dispose(){
    super.dispose();
  }

  timeController() async{
    var timing = const Duration(seconds: 2);
    return Timer(timing, changeroute);
  }
  changeroute(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const AdmissionLogin()
    ));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff2980B9),
              gradient: LinearGradient(
                colors: [(Color(0xff2980B9)),(Color(0xff6dd5fa)), (Color(0xffffffff))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          Center(
            child: Image.asset("assets/images/logopcps.png"),
          )
        ],
      ),
    );
  }
}
