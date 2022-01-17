import 'package:admission_system/Controllers/change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class passwordChange extends StatefulWidget {
  const passwordChange({Key? key}) : super(key: key);

  @override
  _passwordChangeState createState() => _passwordChangeState();
}

class _passwordChangeState extends State<passwordChange> {

  final oldpassword=TextEditingController();
  final newpassword=TextEditingController();
  final confirmnewpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
     return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        title: const Text("Change Password"),
        content: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 10),
            child: SizedBox(
                width: 400,
                height: 500,
                child: SingleChildScrollView(
                    child: Column(children: [
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
                          controller: oldpassword,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelText: "Old Password",
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.all(8.0),
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
                          controller: newpassword,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelText: "New Password",
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.all(8.0),
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
                          controller: confirmnewpassword,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelText:
                            "Confirm New Password",
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
                if (newpassword.text==confirmnewpassword.text){
                  changePassword().passwordChanger(oldpassword.text, newpassword.text).then((result) => {
                  if (result==null){
                      Navigator.of(context).pop()
                }
                else {
                  Fluttertoast.showToast(msg: result)
                }
              } 
              );
                  
                }
                else{
                  Fluttertoast.showToast(msg: "New password didn't matched!");
                }
              },
              child: const Text("Change Password"))
        ]);
  }
}
