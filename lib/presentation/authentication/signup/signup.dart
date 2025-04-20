import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';
import 'package:mentora_app/core/widgets/custom_elevated_button.dart';
import 'package:mentora_app/presentation/authentication/widgets/custom_row.dart';
import 'package:mentora_app/presentation/authentication/widgets/custom_text_form_field.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool passwordObscure = true;
  bool rePasswordObscure = true;
  var formKey = GlobalKey<FormState>();
  String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  String nameRegex = r'^[a-zA-Z ]+$';
  String? email;
  String? password;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create an account",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Start Your Learning Experience",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(flex: 1, child: Image.asset(AssetsManager.logo)),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          text: "Enter Your name",
                          onValidator: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return "Please enter your name";
                            } else if (!RegExp(nameRegex).hasMatch(newValue)) {
                              return "letters only";
                            }
                            name = newValue;
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                          text: "Enter Your Email",
                          onValidator: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(emailRegex).hasMatch(newValue)) {
                              return "Invalid Email";
                            }
                            email = newValue;
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                          text: "Enter Your Password",
                          isObscure: passwordObscure,
                          suffixIcon:
                              passwordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                          onPress: onPasswordPress,
                          onValidator: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return "Please enter your password";
                            } else if (!RegExp(
                              passwordRegex,
                            ).hasMatch(newValue)) {
                              return "Invalid Password";
                            }
                            password = newValue;
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                          text: "Confirm Your Password",
                          isObscure: rePasswordObscure,
                          suffixIcon:
                              rePasswordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                          onPress: onConfirmPassword,
                          onValidator: (newValue) {
                            if (newValue == null || newValue.isEmpty) {
                              return "Please confirm your password";
                            } else if (newValue != password) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24.h),
                        CustomElevatedButton(
                          text: "SignUp",
                          onPress: () {
                            if(formKey.currentState!.validate()){
                              print(name);
                              print(email);
                              print(password);
                              Navigator.pushNamed(
                                context,
                                RoutesManager.continueSignup,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 24.h),
                        CustomRow(
                          text: "Already have an account?",
                          buttonText: "login",
                          onPress: () {
                            Navigator.pushNamed(context, RoutesManager.login,);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPasswordPress() {
    setState(() {
      passwordObscure = !passwordObscure;
    });
  }

  void onConfirmPassword() {
    setState(() {
      rePasswordObscure = !rePasswordObscure;
    });
  }

  // String? onValidate(
  //     {required String? newValue,required String nullText,required String regexText, required String regex}){
  //   if (newValue == null || newValue.isEmpty) {
  //     return nullText;
  //   } else if (!RegExp(
  //     regex,
  //   ).hasMatch(newValue)) {
  //     return regexText;
  //   }
  //   return null;
  // }
}
