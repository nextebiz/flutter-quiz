import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p6/data/quiz_data.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.onTap, required this.saveResult});

  final Function({String screenName}) onTap;
  final Function(List<String> finalResult) saveResult;

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  int counter = 0;
  int totalQuestions = questions.length;
  List<String> result = [];

  onTapAnswer(selectedAnswer) {
    result.add(selectedAnswer);
    setState(() {
      if (counter < totalQuestions - 1) {
        counter++;
      } else {
        widget.saveResult(result);
        widget.onTap(screenName: "result");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.yellow,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BackButton(onPressed: () {
                widget.onTap(screenName: "result");
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Quiz",
                  style: GoogleFonts.aclonica(
                    color: Colors.black87,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text("Displaying Question: ${counter + 1}/$totalQuestions"),
              const SizedBox(
                height: 20,
              ),
              Text(questions[0].questionText ?? "",
                  style: GoogleFonts.roboto(
                    fontSize: 30,
                  )),
              const SizedBox(
                height: 20,
              ),
              ...questions[counter].answers.map((answer) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          onTapAnswer(answer);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            answer,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
