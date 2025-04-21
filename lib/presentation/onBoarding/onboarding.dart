import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:mentora_app/core/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentora_app/core/colors_manager.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  // void _onIntroEnd(context) {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (_) => const HomePage()),
  //   );
  // }

  Widget _buildAnimation(String animationPath) {
    return Lottie.asset(animationPath);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: ColorsManager.black);

    var pageDecoration = PageDecoration(
      imageAlignment: Alignment.center,
      titleTextStyle: GoogleFonts.itim(
        fontSize: 28.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManager.blue,
      ),
      bodyTextStyle: bodyStyle,
      imageFlex: 2,
      imagePadding:  REdgeInsets.only(top: 210, left: 16, right: 16),
      // titlePadding: EdgeInsets.only(top: 40),
    );

    return IntroductionScreen(
      // globalBackgroundColor: ColorsManager.black,
      allowImplicitScrolling: true,
      infiniteAutoScroll: false,
      globalHeader: Row(
        children: [
          Padding(
            padding: REdgeInsets.only(left: 12, top: 18),
            child: Image.asset(AssetsManager.profile, fit: BoxFit.fill),),
          SizedBox(width: 8.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h,),
              Text("Hi, ", style: Theme.of(context).textTheme.titleLarge),
              Text("Welcome to our LXP", style: GoogleFonts.itim(
                fontSize: 20.sp,
                color: ColorsManager.black,
                fontWeight: FontWeight.normal,
              )),
            ],
          )
        ],
      ),
      pages: [
        PageViewModel(
          title: "Welcome to Mentora!",
          body: "Embark on a journey to discover new skills and achieve your goals with ease",
          image: _buildAnimation(Animations.animation1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learning Tailored to You",
          body: "Get a customized learning experience designed to match your interests and career goals.",
          image: _buildAnimation(Animations.animation2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Interactive & Engaging",
          body: "Explore videos, quizzes, and challenges to make learning fun and effective.",
          image: _buildAnimation(Animations.animation3),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Join a Thriving Community",
          body: "Connect with a global community of learners, mentors, and experts.",
          image: _buildAnimation(Animations.animation4),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Ready for a Quick Quiz!",
          body:
          "Read each statement. If you agree with the statement, fill in the circle. There are no wrong answers!  Let's see what you've got!  Goodluck!",
          image: _buildAnimation(Animations.animation5),
          decoration: pageDecoration,
        ),
      ],
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Text(
        'Back',
        style: TextStyle(
          color: ColorsManager.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
      next: const Text(
        'Next',
        style: TextStyle(
          color: ColorsManager.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          color: ColorsManager.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
      onDone: () {
        // Navigator.pushReplacementNamed(context, AppRoutes.splash);
      },
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: ColorsManager.blue,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}