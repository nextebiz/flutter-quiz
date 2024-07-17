import 'package:flutter/material.dart';
import 'package:p6/home.dart';
import 'package:p6/quiz.dart';
import 'package:p6/result.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String? activeScreen = "home";

  Widget? screen;

  List<String>? result;

  openScreen({String? screenName}) {
    setState(() {
      activeScreen = screenName;
    });
  }

  saveResult(List<String> finalResult) {
    setState(() {
      result = finalResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    screen = activeScreen == "home"
        ? Home(
            onTap: openScreen,
          )
        : activeScreen == "quiz"
            ? Quiz(
                onTap: openScreen,
                saveResult: saveResult,
              )
            : activeScreen == "result"
                ? Result(
                    onTap: openScreen,
                    result: result ?? [],
                  )
                : Home(
                    onTap: openScreen,
                  );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
          backgroundColor: Colors.blue,
        ),
        body: screen,
      ),
    );
  }
}
