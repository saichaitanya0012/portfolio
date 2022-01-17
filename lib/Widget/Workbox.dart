import 'package:flutter/material.dart';
import 'package:myportfolio/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Panimalar Institute Of Technology, Chennai",
          subTitle:
              "I Completed my Bachelor's Degree in Electronic and Communication Engineering",
          duration: "2015 - 2019",
        ),
        WorkCustomData(
          title: "The Complete 2020 Flutter Development Bootcamp with Dart",
          subTitle:
              "The Complete 2020 Flutter Development Bootcamp with Dart at Angela Yu,\nUdemy course, Covering all the fundamental concepts for Flutter development",
          duration: "Dec - 2019 to Feb - 2020",
        ),
        WorkCustomData(
          title:
              "Freelancer - Flutter | Dart Mobile App Developer",
          subTitle:
              "",
          duration: "Mar - 2020 to Dec - 2020",
        ),
        WorkCustomData(
          title: "Flutter Mobile Application Developer",
          subTitle:
              "Building both IOS and Android apps with complete custom backend integration.",
          duration: "Dec 2020 -  Present",
        ),
      ],
    );
  }
}
