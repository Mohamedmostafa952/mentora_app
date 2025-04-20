import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentora_app/config/widgets/custom_elevated_button.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Create an account",
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            Text("Start Your Learning Experience",
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall,),
            Expanded(
              flex: 1,
              child: Image.asset(AssetsManager.logo),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(text: "Enter Your Username"),
                    SizedBox(height: 16.h,),
                    CustomTextFormField(text: "Enter Your Email",),
                    SizedBox(height: 16.h,),
                    CustomTextFormField(
                      text: "Enter Your Password",
                      isObscure: passwordObscure,
                      suffixIcon: passwordObscure ? Icons.visibility_off : Icons
                          .visibility,
                      onPress: onPasswordPress,
                    ),
                    SizedBox(height: 16.h,),
                    CustomTextFormField(text: "Confirm Your Password",
                      isObscure: rePasswordObscure,
                      suffixIcon: rePasswordObscure? Icons.visibility_off: Icons.visibility,
                      onPress: onConfirmPassword,
                    ),
                    SizedBox(height: 24.h,),
                    CustomElevatedButton(text: "SignUp", onPress: (){
                      Navigator.pushNamed(context, RoutesManager.continueSignup);
                    }),
                    SizedBox(height: 24.h,),
                    CustomRow(text: "Already have an account?", buttonText: "login", onPress: (){
                      Navigator.pushNamed(context, RoutesManager.login);
                    })
                  ],
                ),
              ),
            ),
          ],
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
}
