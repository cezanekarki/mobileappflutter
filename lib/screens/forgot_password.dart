import 'package:admission_system/Controllers/forgotpassword_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final emailController = TextEditingController();
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        title: const Text("Forgot Password"),
        content: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 10),
            child: SizedBox(
                width: 400,
                height: 500,
                child: SingleChildScrollView(
                    child: Column(children: [
                      Text("Enter email in order to get password reset link!"),
                      Padding(
                        padding: new EdgeInsets.all(20.0),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(50),
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
                            labelText: "Email",
                              icon: Icon(
                                Icons.email,
                                color: Color(0xff6dd5fa),
                              ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.all(8.0),
                      ),

                    ])))),
        actions: <Widget>[
          FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                resetPassword().passwordReseter(emailController.text).then((result) => {
                  if (result==null){
                    Navigator.pop(context)
                  }
                  else{
                Fluttertoast.showToast(msg: result)
                }
                });
              },
              child: const Text("Send Email"))
        ]);
  }
}
