import 'package:bloc_app/screens/common_widgets.dart';
import 'package:bloc_app/screens/register/bloc/register_bloc.dart';
import 'package:bloc_app/screens/register/bloc/register_events.dart';
import 'package:bloc_app/screens/register/bloc/register_states.dart';
import 'package:bloc_app/screens/register/register_controller.dart';
import 'package:bloc_app/screens/signin/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
        builder: ((context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar(context, "Register"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(child: reusableText("Enter your details to register")),
                  Container(
                    margin: EdgeInsets.only(top: 25.h),
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Username"),
                        buildTextField(
                          "Username",
                          "Enter your username",
                          "username",
                          (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UsernameEvent(value));
                          },
                        ),
                        reusableText("Email"),
                        buildTextField(
                          "Email",
                          "Enter your email address",
                          "email",
                          (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          },
                        ),
                        reusableText("Password"),
                        buildTextField(
                          "Password",
                          "Enter your password",
                          "password",
                          (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                        reusableText("Confirm Password"),
                        buildTextField(
                          "Password",
                          "Re-enter your password to confirm",
                          "password",
                          (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvent(value));
                          },
                        ),
                        buildLoginAndRegButton(
                          "Sign Up",
                          'login', // login marker is used to give it the blue color
                          () {
                            RegisterController(context).handleEmailRegister();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
