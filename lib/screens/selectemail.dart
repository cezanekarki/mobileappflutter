import 'package:admission_system/Controllers/email_sender.dart';
import 'package:admission_system/Controllers/emaildata_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


class selectemail extends StatefulWidget {
  const selectemail({Key? key}) : super(key: key);

  @override
  _selectemailState createState() => _selectemailState();
}

class _selectemailState extends State<selectemail> {
  final emailController = Get.put(EmailController());
  String email =Get.arguments.email.toString();
  late final int index;
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Students Data"),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.100,
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                left: 5, right: 5, top: 20),

            child: Column(
              children: [
                Container(
                  margin:const EdgeInsets.only(top: 5),
                  child: Text("Email Templates",style:
                    TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                ),
                Container(
                  child: Text("Tap on templete to send email!",style:
                  TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic
                  ),),
                )
              ],
            ),
          ),
          Container(
            child: Obx(
                () => ListView.builder(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 25),

                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  itemCount: emailController.emailsdata.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.120,
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
                      child: ListTile(
                        title: Text('Title: ${emailController.emailsdata[index].title}',textScaleFactor: 1.5,style:
                          TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                          ),),
                        trailing: Icon(Icons.email),
                        subtitle: Text('Subject: ${emailController.emailsdata[index].subject}',style:
                        TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),),
                        selected: true,
                        onTap: () {
                          print(emailController.emailsdata[index].message.toString());
                          print(email);
                          print(emailController.emailsdata[index].subject.toString());
                          email_sender().send_email(emailController.emailsdata[index].message.toString(),emailController.emailsdata[index].subject.toString(),email);
                        },
                      ),
                    );
                  }
                ),
          ),
          ),
                Align(
                alignment: Alignment.bottomCenter,
          child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back', style: TextStyle(fontSize: 20)),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
          ),
          ),
        ],
      ),
    );


  }
}
