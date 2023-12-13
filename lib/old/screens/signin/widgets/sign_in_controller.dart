import 'package:bloc_app/common/values/constants.dart';
import 'package:bloc_app/common/widgets/toast_item.dart';
import 'package:bloc_app/screens/global.dart';
import 'package:bloc_app/screens/signin/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        // BlocProvider.of<SignInBloc>(context).state;  *just an alternative
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
//
//  ~EMAIL IS EMPTY
//

        if (emailAddress.isEmpty) {
          toastInfo(
              message: "Oops, did you forget to type your email address?");
          return;
          // print("Email is empty");
        }
//
//  ~PW IS EMPTY
//

        if (password.isEmpty) {
          toastInfo(
              message: "Hmm, thought you could sneak in without a password?");
          return;
          // print("Password is empty");
        }

        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
//
//  ~USER DOESNT EXIST
//
          if (credentials.user == null) {
            toastInfo(message: "Doesn't ring a bell, user doesnt exist");
            return;
          }
//
//  ~USER VERIFICATION FAILED
//
          if (!credentials.user!.emailVerified) {
            toastInfo(message: "You should verify yourself");
          }
          var user = credentials.user;
//
//  ~USER  EXISTS
//
          if (user != null) {
            toastInfo(message: "Found you, user exists");
            Global.storageService!.setString(AppConstants.STORAGE_USER_TOKEN_KEY,
                "123456"); // a random number for now //TODO implement firebase user token
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          }
//
//  ~USER DOESNT EXIST
//
          else {
            toastInfo(message: "Not a user currently");
          }
        } on FirebaseAuthException catch (e) {
          //hover on sign in with email and password ont he function call to get the codes
          if (e.code == 'user-not-found') {
            toastInfo(message: "No user found for that one");
          } else if (e.code == 'wrong-password') {
            toastInfo(message: "Perhaps, your password is wrong.");
          } else if (e.code == 'invalid-email') {
            toastInfo(message: "You sure thats your email? Looks invalid");
          }
        } catch (e) {
          toastInfo(message: "Unexpected error: ${e.toString()}");
        }
      }
    } catch (e) {}
  }
}
