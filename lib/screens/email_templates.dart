import 'package:admission_system/Controllers/drawer.dart';
import 'package:admission_system/Controllers/emaildata_controller.dart';
import 'package:admission_system/models/email.dart';
import 'package:admission_system/screens/edit_email.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'emailfulldata.dart';

class email_template extends StatefulWidget {
  const email_template({Key? key}) : super(key: key);

  @override
  _email_templateState createState() => _email_templateState();
}

class _email_templateState extends State<email_template> {
  void dispose(){
    super.dispose();
  }
  final emailController = Get.put(EmailController());
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  final manage_emails me = manage_emails();
  final db = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('Email Template');
  late final int index;


  void clear_data() {
    titleController.clear();
    subjectController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Email Templates"),
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _showpopUp(context);
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(

          child: Obx(
                () =>
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.885,
                  child: ListView.builder(
                      itemCount: emailController.emailsdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                padding: const EdgeInsets.only(left: 20,
                                    right: 20),
                                height: 150,
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
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10),
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, top: 10),
                                            child: Text(
                                                "Title: ${emailController
                                                    .emailsdata[index].title}"
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, top: 10),
                                            child: Text(
                                                "Subject: ${emailController
                                                    .emailsdata[index].subject}"
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                margin:
                                                const EdgeInsets.only(top: 20),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Get.to(showdata()
                                                          ,
                                                          arguments: emailController
                                                              .emailsdata[index]);
                                                    },
                                                    child: Text(
                                                        "View Details"))),
                                            Container(
                                              margin:
                                              const EdgeInsets.only(top: 20),
                                              child: IconButton(
                                                onPressed: () {
                                                Get.to(editEmail(),arguments: emailController.emailsdata[index]);
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ))
                        ]);
                      }),
                ),

          ),
        ));
  }

  Widget _showpopUp(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text("Add New Template"),
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 400,
          height: 500,
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration:
                InputDecoration(labelText: "Title", hintText: "Title"),
              ),
              TextField(
                controller: subjectController,
                decoration:
                InputDecoration(labelText: "Subject", hintText: "Subject"),
              ),
              Expanded(
                child: TextField(
                  controller: messageController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                      labelText: "Input Message", hintText: "Input Message"),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              manage_emails().create_emails(titleController.text,
                  subjectController.text, messageController.text);
              Navigator.of(context).pop();
            },
            child: const Text("Add"))
      ],
    );
  }

}




