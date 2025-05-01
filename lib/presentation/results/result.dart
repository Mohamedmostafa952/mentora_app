import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentora_app/core/colors_manager.dart';
import 'package:mentora_app/core/routes_manager.dart';
import 'package:mentora_app/core/widgets/custom_elevated_button.dart';
import 'package:mentora_app/presentation/questions/questions.dart';
import 'package:mentora_app/presentation/results/result_calculations/big_five.dart';
import 'package:mentora_app/presentation/results/result_calculations/critical_thinking.dart';
import 'package:mentora_app/presentation/results/result_calculations/problem_solving.dart';
import 'package:mentora_app/presentation/results/result_calculations/risac.dart';
import 'package:mentora_app/presentation/results/widgets/user_level.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late ResultDM args;
  late Map<String, int> risacPercentages;
  late Map<String, int> bigFivePercentages;
  late int criticalThinkingResult;
  late int problemSolvingResult;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as ResultDM;

    //Risac calculation
    if (args.quiz.index == 0) {
      final risacCalculator = Risac(
        userAnswers: args.userAnswers,
        risacTypes: args.quiz.questions.map((q) => q.type).toList(),
      );
      risacPercentages = risacCalculator.calculatePercentages();
    } else if (args.quiz.index == 1) {
      final bigFiveCalculator = BigFive(
        userAnswers: args.userAnswers,
        questionTraits: args.quiz.questions.map((q) => q.type).toList(),
      );
      bigFivePercentages = bigFiveCalculator.calculatePercentages();
    } else if (args.quiz.index == 2) {
      final criticalThinking = CriticalThinking(
        questions: args.quiz.questions,
        userAnswers: args.userAnswers,
      );
      criticalThinkingResult = criticalThinking.calculateScores();
    } else {
      final problemSolving = ProblemSolving(
        questions: args.quiz.questions,
        userAnswers: args.userAnswers,
      );
      problemSolvingResult = problemSolving.calculateScores();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 175.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsManager.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: Text(
                  "Congratulations !",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Positioned(
                bottom: -50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 115,
                      height: 115,
                      decoration: BoxDecoration(
                        color: ColorsManager.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorsManager.blue, width: 8),
                      ),
                    ),
                    Positioned(
                      bottom: 96,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsManager.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.check, color: ColorsManager.white),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "100%",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: ColorsManager.blue),
                        ),
                        Text(
                          "${args.quiz.questions.length} of ${args.quiz.questions.length}",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: ColorsManager.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 60.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "Based on your selections, you are",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 16),
          args.quiz.index == 0
              ? Expanded(
                child: ListView.separated(
                  padding: REdgeInsets.symmetric(horizontal: 12),
                  itemCount: Risac.keys.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final type = Risac.keys[index];
                    final percent = risacPercentages[type] ?? 0;

                    return Card(
                      color: ColorsManager.blue,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: REdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                type,
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(color: ColorsManager.white),
                              ),
                            ),
                            Text(
                              '$percent%',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: ColorsManager.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              : args.quiz.index == 1
              ? Expanded(
                child: ListView.separated(
                  padding: REdgeInsets.symmetric(horizontal: 12),
                  itemCount: BigFive.traitKeys.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final type = BigFive.traitKeys[index];
                    final percent = bigFivePercentages[type] ?? 0;

                    return Card(
                      elevation: 2,
                      color: ColorsManager.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: REdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                type,
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(color: ColorsManager.white),
                              ),
                            ),
                            Text(
                              '$percent%',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: ColorsManager.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              : args.quiz.index == 2
              ? Expanded(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      criticalThinkingResult > 80
                          ? UserLevel(level: "Advanced Level")
                          : criticalThinkingResult > 50
                          ? UserLevel(level: "Mid Level")
                          : UserLevel(level: "Low Level"),
                      SizedBox(height: 20.h),
                      Text(
                        "You got $criticalThinkingResult questions correct",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 16.h,),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: ColorsManager.black,
                        thickness: 2,
                      ),
                      SizedBox(height: 16.h,),
                      Container(
                        padding: REdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsManager.blue,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                            "Your score higher then 65% of the people who have taken this test.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: ColorsManager.white),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              )
              : Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  problemSolvingResult > 80
                      ? UserLevel(level: "Level A")
                      : problemSolvingResult > 50
                      ? UserLevel(level: "Level B")
                      : UserLevel(level: "Level C"),
                  SizedBox(height: 20.h),
                  Text(
                    "You got $problemSolvingResult questions correct",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 16.h,),
                  Divider(
                    indent: 16,
                    endIndent: 16,
                    color: ColorsManager.black,
                    thickness: 2,
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    padding: REdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsManager.blue,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      "Your score higher then 65% of the people who have taken this test.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: ColorsManager.white),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 44),
            child: CustomElevatedButton(
              text: args.quiz.index == 3 ? "Go to home" : "Continue",
              onPress: () {
                // Logic to navigate based on quiz index
                if (args.quiz.index == 0) {
                  Navigator.pushNamed(
                    context,
                    RoutesManager.quizzes,
                    arguments: FinishedQuiz(
                      isRisacFinished: true,
                      isBigFiveFinished: false,
                      isCriticalThinkingFinished: false,
                      isProblemSolvingFinished: false,
                    ),
                  );
                } else if (args.quiz.index == 1) {
                  Navigator.pushNamed(
                    context,
                    RoutesManager.quizzes,
                    arguments: FinishedQuiz(
                      isRisacFinished: true,
                      isBigFiveFinished: true,
                      isCriticalThinkingFinished: false,
                      isProblemSolvingFinished: false,
                    ),
                  );
                } else if (args.quiz.index == 2) {
                  Navigator.pushNamed(
                    context,
                    RoutesManager.quizzes,
                    arguments: FinishedQuiz(
                      isRisacFinished: true,
                      isBigFiveFinished: true,
                      isCriticalThinkingFinished: true,
                      isProblemSolvingFinished: false,
                    ),
                  );
                } else {
                  Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FinishedQuiz {
  final bool isRisacFinished;
  final bool isBigFiveFinished;
  final bool isCriticalThinkingFinished;
  final bool isProblemSolvingFinished;

  FinishedQuiz({
    required this.isRisacFinished,
    required this.isBigFiveFinished,
    required this.isCriticalThinkingFinished,
    required this.isProblemSolvingFinished,
  });
}
