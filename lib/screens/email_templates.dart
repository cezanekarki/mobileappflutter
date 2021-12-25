import 'package:admission_system/Controllers/drawer.dart';
import 'package:admission_system/models/email.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class email_template extends StatefulWidget {
  const email_template({Key? key}) : super(key: key);

  @override
  _email_templateState createState() => _email_templateState();
}

class _email_templateState extends State<email_template> {
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  final manage_emails me = manage_emails();
  final db = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Email Template');

  void _submit() {
    try {
      me.create_emails(
          titleController.text, subjectController.text, messageController.text);
    } finally {
      clear_data();
    }
  }

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
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                            decoration: InputDecoration(
                                labelText: "Title", hintText: "Title"),
                          ),
                          TextField(
                            controller: subjectController,
                            decoration: InputDecoration(
                                labelText: "Subject", hintText: "Subject"),
                          ),
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              maxLines: null,
                              expands: true,
                              decoration: InputDecoration(
                                  labelText: "Input Message",
                                  hintText: "Input Message"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          manage_emails().create_emails(titleController.text,
                              subjectController.text, messageController.text);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, index) {
            /*return Container(
          margin: EdgeInsets.all(7),
          height: 150,
          color: Colors.grey[200],
        );*/
            return Scaffold(
                body: StreamBuilder(
                      stream: collectionReference.snapshots(),
                      builder:
                      (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if (snapshot.hasData){
                          return ListView(
                            children: snapshot.data!.docs
                                .map((e) => Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  child: ListTile(
                                      leading: Icon(Icons.icecream),
                                      title: Text(e['title']),
                                      subtitle: Text(e['subject']),
                                      trailing:  IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: (){

                                        },
                                      )
                                  ),
                                ),

                              ],
                            ))
                                .toList(),
                          );

                        }
                      },
                    ),
            );

          }
          ),
    );
  }
}
