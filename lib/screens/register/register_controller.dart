import 'package:bloc_app/common/values/app_constants.dart';
import 'package:bloc_app/common/widgets/toast_item.dart';
import 'package:bloc_app/screens/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String password = state.password;
    String email = state.email;
    String rePassword = state.rePassword;

    //~USERNAME IS EMPTY
    if (username.isEmpty) {
      toastInfo(message: "Username can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: "Password can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(message: "Email can't be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(message: "Password unconfirmed");
      return;
    }

    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credentials.user != null) {
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(username);
        //storing the URL for the photo avatar of theuser
        String? userPhotoURL =
            "${AppConstants.SERVER_API_URL}uploads/default.png";
        await credentials.user?.updatePhotoURL(userPhotoURL);
        toastInfo(
            message:
                "A verification email has been sent to your registered mail id. Activate it now");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: "Weak password");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: "Email already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(message: "Email address is not valid");
      } else if (e.code == "operation-not-allowed") {
        toastInfo(message: "Operation not allowed");
      }
    }
  }
}
