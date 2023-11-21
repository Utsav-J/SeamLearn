import 'package:bloc_app/screens/common_widgets.dart';
import 'package:bloc_app/screens/signin/bloc/sign_in_bloc.dart';
import 'package:bloc_app/screens/signin/bloc/sign_in_events.dart';
import 'package:bloc_app/screens/signin/bloc/sign_in_states.dart';
import 'package:bloc_app/screens/signin/widgets/sign_in_controller.dart';
import 'package:bloc_app/screens/signin/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar(context, "Login"),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTPLogin(context),
                Center(child: reusableText("or use your e-mail")),
                Container(
                  margin: EdgeInsets.only(top: 45.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      buildTextField(
                        "Email",
                        "Enter your email address",
                        "email",
                        (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText("Password"),
                      buildTextField(
                        "Password",
                        "Enter your password",
                        "password",
                        (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        },
                      ),
                      forgotPassword(),
                      buildLoginAndRegButton(
                        "Login",
                        'login',
                        () {
                          SignInController(context: context)
                              .handleSignIn('email');
                        },
                      ),
                      buildLoginAndRegButton(
                        "Register",
                        'register',
                        () {
                          Navigator.of(context).pushNamed("/register");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
