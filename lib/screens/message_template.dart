
import 'package:admission_system/models/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class messages_temp extends StatefulWidget {
  const messages_temp({Key? key}) : super(key: key);

  @override
  _messages_tempState createState() => _messages_tempState();
}

class _messages_tempState extends State<messages_temp> {
  @override
  final titleController =  TextEditingController();
  final messageController =  TextEditingController();
  final db=FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Message Templates"
        ),
      ),
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
                        labelText: "Title",
                        hintText: "Title"
                      ),
                      ),

                         Expanded(
                          child: TextField(
                            controller: messageController,
                            maxLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              labelText: "Input Message",
                              hintText: "Input Message"
                            ),

                          ),
                        ),

                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      manage_messages().create_messages(titleController.text, messageController.text);
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


      body:StreamBuilder<QuerySnapshot>(
          stream: db.collection('Message Template').snapshots(),
          builder: (context, snapshot){
            if (!snapshot.hasData){
              return Center(
                child: Text(
                  "No templates available. Create new template"
                ),
              );
            }
            else{
              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (_,index){

                  return Container(

                    margin: EdgeInsets.all(7),
                    height: 150,
                    color: Colors.grey[200],
                    );

                }
                );

            }
          }
      )
    );
  }
}
