import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/colors_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';
import 'package:mentora_app/core/widgets/arrow_back_icon.dart';
import 'package:mentora_app/core/widgets/custom_elevated_button.dart';
import 'package:mentora_app/core/widgets/custom_text_button.dart';
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
  TextEditingController searchController = TextEditingController();
  String? selectedDegree;
  final dropDownKey = GlobalKey<DropdownSearchState>();
  var formKey = GlobalKey<FormState>();

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
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(flex: 1, child: Image.asset(AssetsManager.logo)),
            Expanded(
              flex: 5,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildDropDownMenu(
                        onValidator: (newValue) {
                          if (newValue == null || newValue.isEmpty) {
                            return "Please select your gender";
                          }
                          return null;
                        },
                        dropDownList: ['Male', 'Female'],
                        hintText: "Select Gender",
                        value: selectedGender,
                        onChange: (item) {
                          selectedGender = item;
                          setState(() {});
                        },
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
                        onValidator: (newValue) {
                          if (newValue == null || newValue.isEmpty) {
                            return "Please choose your role";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      buildDropDownMenu(
                        onValidator: (newValue) {
                          if (newValue == null || newValue.isEmpty) {
                            return "Please choose your degree";
                          }
                          return null;
                        },
                        dropDownList: [
                          "Bachelor's Degree (BA, BS, BBA, etc.)",
                          "Master's Degree (MA, MS, MBA, etc.)",
                          "Doctorate (Ph.D., EdD, etc.)",
                          "High School ",
                        ],
                        hintText: "Choose your degree",
                        value: selectedDegree,
                        onChange: (item) {
                          selectedDegree = item;
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        text: "Enter Your College",
                        onValidator: (newValue) {
                          if (newValue == null || newValue.isEmpty) {
                            return "Please enter your college";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomDateRow(text: "Start date"),
                      SizedBox(height: 16.h),
                      CustomDateRow(text: "Expected / End date"),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextButton(
                            text: "Reset",
                            onPress: () {
                              formKey.currentState!.reset();
                              setState(() {
                                selectedGender = null;
                                selectedRole = SearchFieldListItem(
                                  '',
                                  item: '',
                                );
                                searchController.clear();
                                selectedDegree = null;
                              });
                            },
                            isUnderlined: false,
                          ),
                          SizedBox(width: 26.w),
                          CustomElevatedButton(
                            text: "Start",
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                print(selectedGender);
                                print(selectedRole.item);
                                print(selectedDegree);
                                Navigator.pushNamed(context, RoutesManager.login, arguments: {'fromSignup': true});
                              }
                            },
                          ),
                        ],
                      ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropDownMenu({
    required List<String> dropDownList,
    required String hintText,
    required void Function(String?)? onChange,
    required String? value,
    required String? Function(String?)? onValidator,
  }) {
    return DropdownButtonFormField(
      isExpanded: true,
      validator: onValidator,
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
    required String? Function(String?)? onValidator,
  }) {
    return SearchField(
      controller: searchController,
      hint: hintText,
      validator: onValidator,
      searchInputDecoration: SearchInputDecoration(
        hintStyle: Theme.of(context).textTheme.bodySmall,
      ),
      suggestionStyle: Theme.of(context).textTheme.bodySmall,
      onSuggestionTap: (item) {
        setState(() {
          selectedRole = item;
          searchController.text = item.searchKey;
        });
        onClick?.call(item);
      },
      suggestions: dropDownList.map((item) {
        return SearchFieldListItem(
          item,
          item: item,
          child: Text(
            item,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              // Highlight selected item
              color: selectedRole.item == item
                  ? Colors.blue
                  : Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        );
      }).toList(),
    );
  }
}
