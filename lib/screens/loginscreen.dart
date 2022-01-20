import 'package:admission_system/Controllers/authentication_control.dart';
import 'package:admission_system/models/shared_preferences.dart';
import 'package:admission_system/screens/admissionpage.dart';
import 'package:admission_system/screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';


class AdmissionLogin extends StatefulWidget {
  const AdmissionLogin({Key? key}) : super(key: key);

  @override
  _AdmissionLoginState createState() => _AdmissionLoginState();
}

class _AdmissionLoginState extends State<AdmissionLogin> {
  final LocalAuthentication auth = LocalAuthentication();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  auth_control ac = auth_control();
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  String? errorMessage;


  @override
  void initState() {
    super.initState();
  }
  void dispose(){
    super.dispose();
  }

   _submit(email,password,{bool remember = false} ) async{
    FocusScope.of(context).unfocus();
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      await auth_control().signIn(email:email, password:password).then((result) =>{
      if (result==null){
          Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => admissionpage()))
      }
      else{
        Fluttertoast.showToast(msg: result)
      }
      });
    }
      await (await SessionParams.getSession()).saveSession(email, password);
      return true;
  }

    loginWithBiometrics()async {
      var session = await SessionParams.getSession();
      _authenticate().then((value) => _submit(session.user, session.password, remember: true));
  }


    Future _authenticate() async {
      bool authenticated = false;
      try {
        setState(() {
          _isAuthenticating = true;
          _authorized = 'Authenticating';
        });
        authenticated = await auth.authenticate(
            localizedReason: 'Let OS determine authentication method',
            useErrorDialogs: true,
            stickyAuth: true);
        setState(() {
          _isAuthenticating = false;
        });
      } on PlatformException catch (e) {
        setState(() {
          _isAuthenticating = false;
          _authorized = "Error - ${e.message}";
        });
        return;
      }
      if (!mounted) return;

      setState(
              () =>
          _authorized = authenticated ? 'Authorized' : 'Not Authorized',
      );
    }

    Future<void> _authenticateWithBiometrics() async {
      bool authenticated = false;
      try {
        setState(() {
          _isAuthenticating = true;
          _authorized = 'Authenticating';
        });
        authenticated = await auth.authenticate(
            localizedReason:
            'Scan your fingerprint or face  to authenticate',
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true);
        setState(() {
          _isAuthenticating = false;
          _authorized = 'Authenticating';
        });
      } on PlatformException catch (e) {
        setState(() {
          _isAuthenticating = false;
          _authorized = "Error - ${e.message}";
        });
        return;
      }
      if (!mounted) return;

      final String message = authenticated ? 'Authorized' : 'Not Authorized';
      setState(() {
        _authorized = message;
      });
    }


    bool _isObscure = true;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          key: scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90)),
                      color: Color(0xff2980B9),
                      gradient: LinearGradient(colors: [
                        (Color(0xff2980B9)),
                        (Color(0xff6dd5fa)),
                        (Color(0xffffffff))
                      ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              "assets/images/logopcps.png",
                              height: 250,
                              width: 300,),

                          ),

                        ],

                      ),
                    ),


                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      cursorColor: const Color(0xff000000),
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Color(0xff6dd5fa),
                        ),
                        hintText: "Email",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      cursorColor: const Color(0xff000000),
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.security,
                            color: Color(0xff6dd5fa),
                          ),
                          hintText: "Password",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: IconButton(
                              icon: Icon(
                                  _isObscure ? Icons.visibility : Icons
                                      .visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                }
                                );
                              })
                      ),


                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                      showDialog(context: context, builder: (BuildContext context)
                      {
                        return forgotPassword();
                      });
                      },
                      child: const Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blueGrey,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      minimumSize: const Size(300, 50),
                    ),
                    onPressed: () {
                      _submit(emailController.text,passwordController.text);
                      //Get.lazyPut(() => auth_control.instance.signIn(emailController.text, passwordController.text));
                    },
                    child: const Text("Login"),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        onPrimary: Colors.white,
                        shadowColor: Colors.blueGrey,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        minimumSize: const Size(300, 50),
                      ),
                      onPressed:(){
                        loginWithBiometrics();
                      } ,
                      child: const Text("Biometrics"),
                    ),
                  ),
                ],
              ),
            ),
          )
      );
    }

  }

