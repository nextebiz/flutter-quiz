import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p6/data/quiz_data.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.onTap, required this.result});

  final Function({String screenName}) onTap;
  final List<String> result;

  @override
  Widget build(BuildContext context) {
    int counter = 0;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Result",
              style: GoogleFonts.aclonica(
                color: Colors.black87,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onTap();
            },
            child: const Text(
              "Home",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              ...result.map((myresult) {
                counter++;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      myresult,
                      style:
                          GoogleFonts.b612(fontSize: 20, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        myresult == questions[counter - 1].answers[0]
                            ? "GOOD"
                            : "BAD",
                        style: GoogleFonts.fahkwang(
                            color: myresult == questions[counter - 1].answers[0]
                                ? Colors.green
                                : Colors.red),
                      ),
                    )
                  ],
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
