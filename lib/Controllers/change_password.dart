import 'package:firebase_auth/firebase_auth.dart';

class changePassword{
  Future passwordChanger(String currentPassword, String newPassword) async {
    final user =  FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPassword);

    await user.reauthenticateWithCredential(cred).then((value) async{
       await user.updatePassword(newPassword);
      return null;
    }
    ).catchError((err) {
      return err;
    });}
}