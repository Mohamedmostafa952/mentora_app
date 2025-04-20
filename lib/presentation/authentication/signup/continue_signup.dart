import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentora_app/config/widgets/arrow_back_icon.dart';
import 'package:mentora_app/config/widgets/custom_elevated_button.dart';
import 'package:mentora_app/config/widgets/custom_text_button.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/colors_manager.dart';
import 'package:mentora_app/presentation/authentication/widgets/custom_date_row.dart';
import 'package:searchfield/searchfield.dart';

import '../widgets/custom_text_form_field.dart';

class ContinueSignup extends StatefulWidget {
  const ContinueSignup({super.key});

  @override
  State<ContinueSignup> createState() => _ContinueSignupState();
}

class _ContinueSignupState extends State<ContinueSignup> {
  String? selectedGender;
  SearchFieldListItem<String> selectedRole = SearchFieldListItem<String>(
    '',
    item: '',
  );

  // SearchFieldListItem<String> selectedValue = SearchFieldListItem<String>(
  //   '',
  //   item: '',
  // );

  String? selectedDegree;
  final dropDownKey = GlobalKey<DropdownSearchState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBackIcon(
          onPress: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 65.h,
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: Image.asset(AssetsManager.logo)),
          Expanded(
            flex: 5,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildDropDownMenu(
                    dropDownList: ['Male', 'Female'],
                    hintText: "Select Gender",
                    value: selectedGender,
                    onChange: (item){
                      selectedGender = item;
                      setState(() {

                      });
                    }
                  ),
                  SizedBox(height: 16.h),
                  buildSearchDropDownMenu(
                    hintText: "Choose Your Role",
                    dropDownList: [
                      'Front end Developer',
                      'Product Manager',
                      'Data Scientist',
                      'Software Engineer',
                      'Back end Developer',
                      'Mobile Developer',
                      'UX/UI Designer',
                      'DevOps Engineer',
                      'QA Engineer',
                      'Full Stack Developer',
                      'System Architect',
                      'Technical Lead',
                      'Engineering Manager',
                      'AI/ML Engineer',
                      'Cloud Engineer',
                      'Student',
                    ],
                    onClick: (newItem) {
                      selectedRole = newItem;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 16.h),
                  buildDropDownMenu(
                    dropDownList: [
                      "Bachelor's Degree (BA, BS, BBA, etc.)",
                      "Master's Degree (MA, MS, MBA, etc.)",
                      "Doctorate (Ph.D., EdD, etc.)",
                      "High School ",
                    ],
                    hintText: "Choose your degree",
                    value: selectedDegree,
                    onChange: (item){
                      selectedDegree = item;
                      setState(() {

                      });
                    }
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    text: "Enter Your College",
                  ),
                  SizedBox(height: 16.h),
                  CustomDateRow(text: "Start date", textOfTextField: "YYYY"),
                  SizedBox(height: 16.h),
                  CustomDateRow(text: "Expected / End date", textOfTextField: "YYYY"),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextButton(text: "Reset", onPress: (){}, isUnderlined: false,),
                      SizedBox(width: 26.w,),
                      CustomElevatedButton(text: "Signup", onPress: (){}),
                    ],
                  )
                  // selectedRole.item != null
                  //     ? Text("${selectedRole.item}")
                  //     : Text("data"),
                  // SizedBox(height: 20),
                  // selectedDegree != null
                  //     ? Text("$selectedDegree")
                  //     : Text("data"),
                  // selectedGender != null
                  //     ? Text("$selectedGender")
                  //     : Text("data"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropDownMenu({
    required List<String> dropDownList,
    required String hintText,
    required void Function(String?)? onChange,
    required String? value
  }) {
    return DropdownButtonFormField(
      isExpanded: true,
      items:
          dropDownList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: Theme.of(context).textTheme.bodySmall),
            );
          }).toList(),
      value: value,
      onChanged: onChange,
      hint: Text(hintText, style: Theme.of(context).textTheme.bodySmall),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: ColorsManager.black),
        ),
      ),
    );
  }

  Widget buildSearchDropDownMenu({
    required List<String> dropDownList,
    required String hintText,
    required Function(SearchFieldListItem<String>)? onClick,
  }) {
    return SearchField(
      hint: hintText,
      onSuggestionTap: onClick,
      suggestions:
          dropDownList.map((item) {
            return SearchFieldListItem(item, item: item, child: Text(item));
          }).toList(),
    );
  }
}
