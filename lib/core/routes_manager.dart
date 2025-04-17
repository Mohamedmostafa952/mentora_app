import 'package:flutter/material.dart';
import 'package:mentora_app/presentation/authentication/login/login.dart';

class RoutesManager{
  static const String login = "/login";



  static Map<String,WidgetBuilder> routes ={
    login: (_)=> Login(),
  };
}