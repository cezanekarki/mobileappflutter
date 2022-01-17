import 'dart:ui';
import 'package:admission_system/Controllers/email_sender.dart';
import 'package:admission_system/Controllers/register_user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class add_users extends StatefulWidget {
  const add_users({Key? key}) : super(key: key);

  @override
  _add_usersState createState() => _add_usersState();
}

class _add_usersState extends State<add_users> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final nameEditingController =  TextEditingController();
  final emailEditingController =  TextEditingController();
  final passwordEditingController =  TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final reg_user ru = reg_user();

  void _submit(){
    FocusScope.of(context).unfocus();
    var parsedvalue = int.parse(phoneNumberEditingController.text);
    String email_receipents=emailEditingController.text;
    String email_subject="Email and password for PCPS System account";
    String email_body ="The password for the account ${nameEditingController.text}, (${emailEditingController.text}) is ${passwordEditingController.text}. Please change the password after the login.";
    try{
      ru.signUp(emailEditingController.text, passwordEditingController.text, nameEditingController.text, parsedvalue);
      email_sender().send_email(email_body, email_subject, email_receipents).then((result) => {
        if (result==null){
          Fluttertoast.showToast(msg: "Email sent")
        }
        /*else{
          //Fluttertoast.showToast(msg: result)
        }*/
      });
    }
    finally{
      clear_text();
    }

  }

  String? validateName(String value) {
    RegExp regex = RegExp(r'^.{3,}$');
    if (value!.isEmpty) {
      return ("First Name cannot be Empty");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid name(Min. 3 Character)");
    }
    return null;
  }

  String? validateEmail(String value){
    if (value!.isEmpty) {
      return ("Please Enter Your Email");
    }
    // reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      return ("Please Enter a valid email");
    }
    return null;
  }

  String? validatePassword(String value){
    RegExp regex =  RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return ("Password is required for login");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid Password(Min. 6 Character)");
    }
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
          title: const Text("Add Users"),
        ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xff2980B9),

          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.20,

                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "Register User",
                          style: TextStyle(
                            color:Color(0xFFE5E3DD),
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        )

                      ),

                    ],

                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: nameEditingController,

                      style: const TextStyle(
                        color:
                        Colors.black54,
                      ),
                      onChanged: null,
                      decoration: InputDecoration(
                        errorText: validateName(nameEditingController.text),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            width: 2,
                            color:
                            Colors.black54,
                            style: BorderStyle.solid,
                          ),
                        ),
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                          color:
                          Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: TextField(
                      controller: emailEditingController,
                      style: const TextStyle(
                        color:
                        Colors.black54,
                      ),
                      onChanged: null,
                      decoration: InputDecoration(
                        errorText: validateEmail(emailEditingController.text),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            width: 2,
                            color:
                            Colors.black54,
                            style: BorderStyle.solid,
                          ),
                        ),
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          color:
                          Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: passwordEditingController,
                      style: const TextStyle(
                        color:
                        Colors.black54,
                      ),
                      onChanged: null,
                      decoration: InputDecoration(
                          errorText: validatePassword(passwordEditingController.text),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              width: 2,
                              color:
                              Colors.black54,
                              style: BorderStyle.solid,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color:
                            Colors.black54,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                  _isObscure ? Icons.visibility : Icons
                                      .visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                }
                                );
                              })
                      ),
                      obscureText: _isObscure,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: TextField(
                      controller: phoneNumberEditingController,
                      style: const TextStyle(
                        color:
                        Colors.black54,
                      ),
                      onChanged: null,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            width: 2,
                            color:
                            Colors.black54,
                            style: BorderStyle.solid,
                          ),
                        ),
                        hintText: 'Phone Number',
                        hintStyle: const TextStyle(
                          color:
                          Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        onPrimary: Colors.white,
                        shadowColor: Colors.blueGrey,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        minimumSize: const Size(300, 50),
                      ),

                      onPressed: () {
                        _submit();
                      },
                      child: const Text("Add User"),
                    ),
                  ],
                ),
              ),
        ]
      ),
    )
      )
    );
  }
  void clear_text(){
    nameEditingController.clear();
    emailEditingController.clear();
    passwordEditingController.clear();
    phoneNumberEditingController.clear();
}

}


