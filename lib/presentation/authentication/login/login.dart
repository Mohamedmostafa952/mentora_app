import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/colors_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';
import 'package:mentora_app/core/widgets/custom_elevated_button.dart';
import 'package:mentora_app/core/widgets/custom_text_button.dart';
import 'package:mentora_app/presentation/authentication/widgets/custom_row.dart';
import 'package:mentora_app/presentation/authentication/widgets/custom_text_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key, this.fromSignup = false});

  final bool fromSignup;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObscure = true;
  var formKey = GlobalKey<FormState>();
  String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  String? email;
  String? password;
  bool fromSignup = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    setState(() {
      fromSignup = args?['fromSignup'] ?? widget.fromSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return fromSignup?Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(flex: 1, child: Image.asset(AssetsManager.logo)),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                      SizedBox(height: 32.h),
                      CustomTextFormField(
                        text: "Enter Your Password",
                        suffixIcon:
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        onPress: onPasswordVisibility,
                        isObscure: isObscure,
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
                      SizedBox(height: 26.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          text: "Forget Password",
                          onPress: () {},
                        ),
                      ),
                      SizedBox(height: 26.h),
                      CustomElevatedButton(
                        text: "Login",
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            print(email);
                            print(password);
                            Navigator.pushReplacementNamed(context, RoutesManager.onboarding);
                          }
                        },
                      ),
                      SizedBox(height: 28.h),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    :Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "Hi, Welcome Back! 👋",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(flex: 1, child: Image.asset(AssetsManager.logo)),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                      SizedBox(height: 28.h),
                      CustomTextFormField(
                        text: "Enter Your Password",
                        suffixIcon:
                            isObscure ? Icons.visibility_off : Icons.visibility,
                        onPress: onPasswordVisibility,
                        isObscure: isObscure,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          text: "Forget Password",
                          onPress: () {},
                        ),
                      ),
                      CustomElevatedButton(
                        text: "Login",
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            print(email);
                            print(password);
                            Navigator.pushReplacementNamed(context, RoutesManager.home);
                          }
                        },
                      ),
                      SizedBox(height: 28.h),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: ColorsManager.black,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            "or with",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: ColorsManager.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(IconsAssets.facebook),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(IconsAssets.google),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(IconsAssets.apple),
                          ),
                        ],
                      ),
                      SizedBox(height: 28.h),
                      CustomRow(
                        text: "Don’t have an account?",
                        buttonText: "Signup",
                        onPress: () {
                          Navigator.pushNamed(context, RoutesManager.signup);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }
}
