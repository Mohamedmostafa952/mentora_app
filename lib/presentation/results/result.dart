import 'package:flutter/material.dart';
import 'package:mentora_app/core/routes_manager.dart';
import 'package:mentora_app/core/widgets/custom_elevated_button.dart';
import 'package:mentora_app/presentation/questions/questions.dart';
import 'package:mentora_app/presentation/results/result_calculations/big_five.dart';
import 'package:mentora_app/presentation/results/result_calculations/critical_thinking.dart';
import 'package:mentora_app/presentation/results/result_calculations/problem_solving.dart';
import 'package:mentora_app/presentation/results/result_calculations/risac.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late ResultDM args;
  late Map<String, int> risacPercentages;
  late Map<String, int> bigFivePercentages;
  late double criticalThinkingResult;
  late String problemSolvingResult;

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
        children: [
          args.quiz.index == 0
              ? Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(24),
                  itemCount: Risac.keys.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final type = Risac.keys[index];
                    final percent = risacPercentages[type] ?? 0;

                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          type,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: Text(
                          '$percent%',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              )
              : args.quiz.index == 1
              ? Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(24),
                  itemCount: BigFive.traitKeys.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final type = BigFive.traitKeys[index];
                    final percent = bigFivePercentages[type] ?? 0;

                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          type,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: Text(
                          '$percent%',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              )
              : args.quiz.index == 2
              ? Center(child: Text("$criticalThinkingResult %"))
              : Center(child: Text("$problemSolvingResult %")),
          CustomElevatedButton(
            text: "Go to quizzes",
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
                Navigator.pushReplacementNamed(context, RoutesManager.home);
              }
            },
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
