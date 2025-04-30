import 'package:flutter/material.dart';
import 'package:mentora_app/presentation/Quizzes/quizes.dart';
import 'package:mentora_app/presentation/authentication/login/login.dart';
import 'package:mentora_app/presentation/authentication/signup/continue_signup.dart';
import 'package:mentora_app/presentation/authentication/signup/signup.dart';
import 'package:mentora_app/presentation/community.dart';
import 'package:mentora_app/presentation/edit_profile.dart';
import 'package:mentora_app/presentation/home.dart';
import 'package:mentora_app/presentation/onBoarding/onboarding.dart';
import 'package:mentora_app/presentation/profile.dart';
import 'package:mentora_app/presentation/questions/questions.dart';
import 'package:mentora_app/presentation/quizDetails/quiz_details.dart';
import 'package:mentora_app/presentation/results/result.dart';
import 'package:mentora_app/presentation/road_map.dart';

class RoutesManager{
  static const String login = "/login";
  static const String signup = "/signup";
  static const String continueSignup = "/continueSignup";
  static const String onboarding = "/onboarding";
  static const String quizzes = "/quizzes";
  static const String quizDetails = "/quizDetails";
  static const String questions = "/questions";
  static const String result = "/result";
  static const String home = "/home";
  static const String roadMap = "/roadMap";
  static const String profile = "/profile";
  static const String community = "/community";
  static const String editProfile = "/editProfile";

  static Map<String,WidgetBuilder> routes ={
    login: (_)=> Login(),
    signup: (_)=> Signup(),
    continueSignup : (_)=> ContinueSignup(),
    onboarding: (_) => Onboarding(),
    quizzes: (_) => Quizzes(),
    quizDetails: (_) => QuizDetails(),
    questions: (_)=> Questions(),
    result: (_) => Result(),
    home: (_) => Home(),
    roadMap:(_) => RoadMap(),
    profile: (_) => Profile(),
    community:(_)=> Community(),
    editProfile: (_) => EditProfile()
  };
}