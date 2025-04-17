import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentora_app/config/widgets/custom_elevated_button.dart';
import 'package:mentora_app/config/widgets/custom_text_button.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/colors_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';
import 'package:mentora_app/presentation/authentication/widgets/custom_text_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    CustomTextFormField(text: "Enter Your Email"),
                    SizedBox(height: 28.h),
                    CustomTextFormField(
                      text: "Enter Your Password",
                      suffixIcon:
                          isObscure ? Icons.visibility_off : Icons.visibility,
                      onPress: onPasswordVisibility,
                      isObscure: isObscure,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        text: "Forget Password",
                        onPress: () {},
                      ),
                    ),
                    CustomElevatedButton(text: "Login", onPress: (){}),
                    SizedBox(height: 30.h,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: ColorsManager.black,
                          ),
                        ),
                        SizedBox(width: 12.w,),
                        Text("or with", style: Theme.of(context).textTheme.bodySmall,),
                        SizedBox(width: 12.w,),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: ColorsManager.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/facebook.svg")),
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/google.svg")),
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/apple.svg")),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account?", 
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        CustomTextButton(text: "Signup", onPress: (){
                          Navigator.pushNamed(context, RoutesManager.signup);
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
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
