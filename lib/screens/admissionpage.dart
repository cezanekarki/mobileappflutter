import 'package:admission_system/Controllers/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class admissionpage extends StatefulWidget {
  const admissionpage({Key? key}) : super(key: key);

  @override
  _admissionpageState createState() => _admissionpageState();
}

class _admissionpageState extends State<admissionpage> {
  @override
  final db = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('notes');
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admission Page"),
        ),
        drawer: MyDrawer(),
        body: StreamBuilder(
          stream: collectionReference.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs
                    .map((e) => Column(
                          children: [
                            Card(
                              elevation: 5,
                              child: ListTile(
                                leading: Icon(Icons.icecream),
                                title: Text(e['title']),
                                subtitle: Text(e['content']),
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
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
