import 'dart:convert';

import 'package:bloc_app/common/apis/user_api.dart';
import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/common/values/colors.dart';
import 'package:bloc_app/common/values/app_constants.dart';
import 'package:bloc_app/common/widgets/toast_item.dart';
import 'package:bloc_app/screens/global.dart';
import 'package:bloc_app/screens/signin/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInController {
  final BuildContext context;
  const SignInController({
    required this.context,
  });

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
            // toastInfo(message: "Found you, user exists");
            String? userDisplayName = user.displayName;
            String? userEmail = user.email;
            String? userID = user.uid;
            String? userPhotoURL = user.photoURL;
            print(userID);

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.name = userDisplayName;
            loginRequestEntity.email = userEmail;
            loginRequestEntity.open_id = userID;
            loginRequestEntity.type = 1; // type 1 means EMAIL LOGIN

            loginRequestEntity.avatar = userPhotoURL;
            // print(userPhotoURL);
            asyncPostAllData(loginRequestEntity);
            Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY,
                "123456"); // a random number for now
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

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator:
          const CircularProgressIndicator(color: AppColors.primaryElement),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    var result = await UserAPI.login(loginRequestEntity: loginRequestEntity);
    // print(result.toString());

    if (result.code == 200) {
      try {
        Global.storageService.setString(
          AppConstants
              .STORAGE_USER_PROFILE_KEY, // stores the whole set of user data in the app constant
          jsonEncode(result.data!),
        );

        Global.storageService.setString(
          AppConstants
              .STORAGE_USER_TOKEN_KEY, // stores the unique login token given for each login
          result.data!.access_token!,
        ); // need to make sure that is it not null here
        EasyLoading.dismiss();
        if (!context.mounted) return;
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/application", (route) => false);
      } catch (e) {
        print("Local storage error: ${e.toString()}");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(message: "Unknown error occurred");
    }
  }
}
