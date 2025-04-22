import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/colors_manager.dart';
import 'package:mentora_app/core/widgets/custom_elevated_button.dart';
import 'package:mentora_app/presentation/Quizzes/widgets/custom_quizzes_row.dart';

class QuizContainer extends StatelessWidget {
  const QuizContainer({
    super.key,
    required this.title,
    required this.questionsNumber,
    required this.time,
    required this.rating,
    required this.imagePath,
    required this.isSelected,
    required this.onTap
  });

  final String title;
  final String questionsNumber;
  final String time;
  final String rating;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: REdgeInsets.only(top: 34, bottom: 20,),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color:isSelected? ColorsManager.blue : ColorsManager.grey, width: 3.w,),
          ),
          child: Padding(
            padding: REdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 1,child: Image.asset(imagePath)),
                SizedBox(width: 20.w),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.titleMedium),
                      Row(
                        children: [
                          CustomQuizzesRow(
                            text: "$questionsNumber Questions",
                            iconPath: IconsAssets.questions,
                          ),
                          SizedBox(width: 50.w,),
                          Row(children: [SvgPicture.asset(IconsAssets.star), Text(rating)]),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      CustomQuizzesRow(
                        text: "$time min",
                        iconPath: IconsAssets.timer,
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
  }
}
