import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_pos_que/enum/action_dialog.enum.dart';
import 'package:my_pos_que/helper/dialog.dart';

class AuthService {
  static final _instance = FirebaseAuth.instance;

  static login() {}

  static register(String emailAddress, String password) async {
    try {
      final credential = await _instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await _verificationEmail(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showActionDialog(
          "Kata sandi yang diberikan terlalu lemah.",
          actionDialog: ActionDialog.warning,
        );
      } else if (e.code == 'email-already-in-use') {
        showActionDialog(
          "Email yang Anda masukan sudah terdaftar.",
          actionDialog: ActionDialog.warning,
        );
      }
    } catch (e) {
      requestErrorDialog();
    }
  }

  static _verificationEmail(UserCredential credential) async {
    try {
      var user = credential.user!;
      await user.sendEmailVerification();
      showActionDialog(
        "Kami telah mengirim email verifikasi ke ${user.email}",
        actionDialog: ActionDialog.success,
      );
    } catch (e) {
      requestErrorDialog();
    }
  }
}
