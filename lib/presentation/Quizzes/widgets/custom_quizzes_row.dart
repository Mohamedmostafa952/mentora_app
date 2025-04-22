import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentora_app/core/colors_manager.dart';

class CustomQuizzesRow extends StatelessWidget {
  const CustomQuizzesRow({super.key, required this.text, required this.iconPath});

  final String text;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        Text(text, style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ColorsManager.grey
        ),)
      ],
    );
  }
}
