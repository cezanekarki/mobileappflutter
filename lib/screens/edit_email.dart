import 'package:admission_system/models/email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class editEmail extends StatefulWidget {
  const editEmail({Key? key}) : super(key: key);

  @override
  _editEmailState createState() => _editEmailState();
}

class _editEmailState extends State<editEmail> {

  void dispose(){
    super.dispose();
  }
  String title=Get.arguments.title.toString();
  String subject=Get.arguments.subject.toString();
  String message=Get.arguments.message.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Email Template Edit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:[
            Container(
            margin: const EdgeInsets.only(top: 50,left: 10,right: 10),
                child: SizedBox(
                  width: 400,
                  height: 500,
                  child: Column(
                    children: [
                      Text("Title:$title",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:30,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left,),
                      TextFormField(
                        initialValue: subject,
                        onChanged: (String? newValue) {
                          setState(() {
                            subject = newValue!;
                          });
                        },
                        decoration:
                        InputDecoration(labelText: "Subject"),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: message,
                          onChanged: (String? newValue) {
                            setState(() {
                              message = newValue!;
                            });
                          },
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(
                              labelText: "Input Message"),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
              }, child: Text("Back")
              ),
                ElevatedButton(onPressed: (){
                  manage_emails().update_emails(title, subject, message);
                  Navigator.pop(context);
                }, child: Text("Update")
                ),

              ]
            )
      ],
        ),
      ),

    );
  }
}
