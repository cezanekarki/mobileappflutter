import 'package:admission_system/models/email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class showdata extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Email Templates"),
        ),
       body:Column(
         children: [
           Container(
             height: 575,
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
             margin: const EdgeInsets.only(
                 left: 20, right: 20, top: 20),
             padding: const EdgeInsets.only(left: 20,
                 right: 20),
             child: SingleChildScrollView(
               child: Column(
                 children: [
                      Container(
                        margin: const EdgeInsets.only(
                             top: 40),
                        padding: const EdgeInsets.only(left: 40,
                            right: 40),
                        alignment: Alignment.topLeft,

                        child: Text("Title:  ${Get.arguments.title.toString()}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                   Container(
                     margin: const EdgeInsets.only(
                         top: 30),

                     alignment: Alignment.topLeft,
                     child: Text("Subject:  ${Get.arguments.subject.toString()}",
                       style: TextStyle(
                         fontSize: 20,
                       ),
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.only(
                          top: 30),

                     alignment: Alignment.topLeft,
                     child: Text("Body:  ${Get.arguments.message.toString()}"
                         ,style: TextStyle(
                         fontSize: 20,
                       ),
                     ),
                   ),
                 ],
               ),

             ),
           ),
           Row(
             mainAxisAlignment:
             MainAxisAlignment.spaceBetween,
             children: [

               Padding(
                 padding: const EdgeInsets.all(17.0),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.blueGrey,
                     onPrimary: Colors.white,
                     shadowColor: Colors.blueGrey,
                     elevation: 0.0,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(50.0)),
                     minimumSize: const Size(150, 50),
                   ),
                   onPressed: () {
                     Navigator.pop(context);
                   },
                   child: const Text("Back"),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(17.0),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.blueGrey,
                     onPrimary: Colors.white,
                     shadowColor: Colors.blueGrey,
                     elevation: 0.0,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(50.0)),
                     minimumSize: const Size(150, 50),
                   ),
                   onPressed: () {
                     try {
                       manage_emails().delete_emails(Get.arguments.title);
                       Fluttertoast.showToast(msg: "Template deleted successfully!");
                       Navigator.pop(context);
                     }
                     catch (e){
                       Fluttertoast.showToast(msg: "Error deleting template!");
                     }
                   },
                   child: const Text("Delete"),
                 ),
               ),
             ],
           ),
         ],

       ),




    );
  }

}
