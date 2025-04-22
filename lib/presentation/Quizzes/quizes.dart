import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:mentora_app/core/colors_manager.dart';
import 'package:mentora_app/core/widgets/custom_elevated_button.dart';
import 'package:mentora_app/presentation/Quizzes/widgets/quiz_container.dart';

class Quizzes extends StatefulWidget {
  const Quizzes({super.key});

  @override
  State<Quizzes> createState() => _QuizzesState();
}

class _QuizzesState extends State<Quizzes> {
  int selectedIndex = 0;
  bool risacSelected = false;
  bool bigFiveSelected = false;
  bool criticalThinkingSelected = false;
  bool problemSolvingSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: ColorsManager.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Hi,",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Let's test your knowledge",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: ColorsManager.blue,
                    dividerColor: Colors.transparent,
                    onTap: (index) {
                      selectedIndex = index;
                      setState(() {});
                    },

                    tabs: [
                      Text(
                        "Personality",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorsManager.blue,
                        ),
                      ),
                      Text(
                        "Skills",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorsManager.blue,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    // Important for TabBarView to take remaining space
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: REdgeInsets.only(top: 34, bottom: 20, left: 26, right: 26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              QuizContainer(
                                imagePath: AssetsManager.riasec,
                                title: "RIASEC TEST",
                                questionsNumber: "42",
                                time: "42",
                                rating: "4.8",
                                isSelected: risacSelected,
                                onTap: () {
                                  risacSelected = !risacSelected;
                                  bigFiveSelected = false;
                                  criticalThinkingSelected = false;
                                  problemSolvingSelected = false;

                                  setState(() {});
                                },
                              ),
                              QuizContainer(
                                imagePath: AssetsManager.bigFive,
                                title: "Big Five Assessment",
                                questionsNumber: "30",
                                time: "30",
                                rating: "4.9",
                                isSelected: bigFiveSelected,
                                onTap: () {
                                  bigFiveSelected = !bigFiveSelected;
                                  risacSelected = false;
                                  criticalThinkingSelected = false;
                                  problemSolvingSelected = false;

                                  setState(() {});
                                },
                              ),
                              Spacer(),
                              risacSelected? CustomElevatedButton(text: "Start Quiz", onPress: (){}) : Container(),
                              bigFiveSelected? CustomElevatedButton(text: "Start Quiz", onPress: (){}) : Container(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.symmetric(horizontal: 26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              QuizContainer(
                                title: "Critical Thinking Assessment",
                                questionsNumber: "30",
                                time: "45",
                                rating: "4.7",
                                imagePath: AssetsManager.criticalThinking,
                                isSelected: criticalThinkingSelected,
                                onTap: () {
                                  criticalThinkingSelected =
                                      !criticalThinkingSelected;
                                  problemSolvingSelected = false;
                                  bigFiveSelected = false;
                                  risacSelected = false;

                                  setState(() {});
                                },
                              ),
                              QuizContainer(
                                title: "Problem Solving Assessment",
                                questionsNumber: "30",
                                time: "45",
                                rating: "4.7",
                                imagePath: AssetsManager.problemSolving,
                                isSelected: problemSolvingSelected,
                                onTap: () {
                                  problemSolvingSelected =
                                      !problemSolvingSelected;
                                  criticalThinkingSelected = false;
                                  bigFiveSelected = false;
                                  risacSelected = false;
                                  setState(() {});
                                },
                              ),
                              Spacer(),
                              criticalThinkingSelected? CustomElevatedButton(text: "Start Quiz", onPress: (){}) : Container(),
                              problemSolvingSelected? CustomElevatedButton(text: "Start Quiz", onPress: (){}) : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
