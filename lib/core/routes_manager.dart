import 'package:flutter/material.dart';
import 'package:mentora_app/presentation/authentication/login/login.dart';
import 'package:mentora_app/presentation/authentication/signup/signup.dart';

class RoutesManager{
  static const String login = "/login";
  static const String signup = "/signup";

  static Map<String,WidgetBuilder> routes ={
    login: (_)=> Login(),
    signup: (_)=> Signup()
  };
}