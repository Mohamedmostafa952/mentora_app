import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentora_app/core/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.text, this.suffixIcon, this.onPress, this.isObscure = false, this.onValidator});

  final String text;
  final IconData? suffixIcon;
  final VoidCallback? onPress;
  final bool isObscure;
  final String? Function(String?)? onValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      validator: onValidator,
      cursorColor: ColorsManager.black.withOpacity(0.7),
      style: GoogleFonts.itim(
        fontSize: 16.sp,
        color: ColorsManager.black.withOpacity(0.7),
      ),
      decoration: InputDecoration(hintText: text,
      suffixIcon: IconButton(onPressed: onPress, icon: Icon(suffixIcon)),
      ),
    );
  }
}
