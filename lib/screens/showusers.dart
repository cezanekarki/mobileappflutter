import 'package:admission_system/Controllers/drawer.dart';
import 'package:admission_system/Controllers/phone_call.dart';
import 'package:admission_system/Controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class showUser extends StatefulWidget {
  const showUser({Key? key}) : super(key: key);

  @override
  _showUserState createState() => _showUserState();
}

class _showUserState extends State<showUser> {
  @override
  void dispose(){
    super.dispose();
  }
  User? user = FirebaseAuth.instance.currentUser!;
  final userController = Get.put(UserController());
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("User Data"),
      ),
      body: Column(
        children: [
          Container(
            child: Obx(
                  () => Container(
                    height: MediaQuery.of(context).size.height * 0.895,
                    child: usersdata(userController.userdata.length),
                  )
            ),
          ),
        ],
      ),
    );
  }
  Widget usersdata(int itemquery){
    if (itemquery== null || itemquery== 0 ){
      return Container(
        alignment: Alignment.center,
        child: Text("No data found!",style:
        TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontStyle: FontStyle.italic
        ),),
      );
    }
    else {
      return ListView.builder(
          itemCount: itemquery,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20),
                    padding:
                    const EdgeInsets.only(left: 20, right: 20),
                    height: MediaQuery.of(context).size.height * 0.190,
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
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Name: ${userController.userdata[index].name}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: IconButton(
                                onPressed: () {
                                  try {
                                    makephonecalls().makingPhoneCall(
                                        userController
                                            .userdata[index]
                                            .phoneNumber
                                            .toString());
                                    Fluttertoast.showToast(
                                        msg: "Calling!");
                                  } catch (e) {
                                    Fluttertoast.showToast(
                                        msg: "Cannot make calls");
                                  }
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.greenAccent,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                "Email: ${userController.userdata[index].email}",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            /*Container(
                              child: IconButton(
                                onPressed: () {
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),*/
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(onPressed: (){

                            },
                                child: Text("Delete User"))
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      );
    }
  }
}
