import 'package:flutter/material.dart';
import 'package:mentora_app/presentation/authentication/widgets/custom_text_form_field.dart';

class CustomDateRow extends StatelessWidget {
  const CustomDateRow({super.key, required this.text, required this.textOfTextField});

  final String text;
  final String textOfTextField;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyMedium,)),
        Spacer(),
        Expanded(child: CustomTextFormField(text: textOfTextField))
      ],
    );
  }
}
