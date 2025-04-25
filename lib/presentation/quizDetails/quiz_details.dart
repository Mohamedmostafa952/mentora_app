import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/colors_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';
import 'package:mentora_app/core/widgets/custom_elevated_button.dart';
import 'package:mentora_app/data/DM/quiz_dm.dart';
import 'package:mentora_app/presentation/quizDetails/widgets/instructions_row.dart';
import 'package:mentora_app/presentation/quizDetails/widgets/quiz_details_custom_row.dart';

import '../../data/DM/question_dm.dart';

class QuizDetails extends StatefulWidget {
  const QuizDetails({super.key});

  @override
  State<QuizDetails> createState() => _QuizDetailsState();
}

class _QuizDetailsState extends State<QuizDetails> {
  late QuizDM args;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as QuizDM;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: ColorsManager.white),
        ),
        title: Text(
          "Detail Quiz",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: ColorsManager.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: Padding(
            padding: REdgeInsets.only(bottom: 18, left: 28, right: 28),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args.quizName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorsManager.white,
                      ),
                    ),
                    Text(
                      "GET ${args.totalPoints} Points",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(IconsAssets.star),
                    Text(
                      "${args.rating}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(top: 28, left: 28, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Brief explanation about this quiz",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              QuizDetailsCustomRow(
                iconPath: IconsAssets.questions,
                firstText: "${args.questionNumber} Questions",
                secondText: "${args.pointsForEachQuestion} points for a correct answer",
              ),
              QuizDetailsCustomRow(
                iconPath: IconsAssets.timer,
                firstText: "${args.quizTime} min",
                secondText: "Total duration of the quiz",
              ),
              QuizDetailsCustomRow(
                iconPath: "",
                isStar: true,
                firstText: "Win ${args.winStars} star",
                secondText: "Earn your first badge",
              ),
              Text("Please read the text below carefully so you can understand it"),
              SizedBox(height: 16.h,),
              InstructionsRow(text: "Tap on options to select the correct answer"),
              InstructionsRow(text: "Tap on the bookmark icon to save interesting questions"),
              InstructionsRow(text: "Click submit if you are sure you want to complete all the quizzes"),
              SizedBox(height: 16.h,),
              CustomElevatedButton(text: "Get Started", onPress: (){
                Navigator.of(context).pushReplacementNamed(RoutesManager.questions, arguments: QuestionsAndIndexDm(questions: args.questions, quizDM: args));
              }),
              SizedBox(height: 16.h,),
            ],
          ),
        ),
      ),
    );
  }
}


class QuestionsAndIndexDm{
  List<QuestionDM> questions;
  QuizDM quizDM;

  QuestionsAndIndexDm({required this.questions, required this.quizDM});
}