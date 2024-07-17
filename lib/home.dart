import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.onTap});

  final Function({String screenName}) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Text(
              "App Home Screen",
              style: GoogleFonts.aclonica(
                color: Colors.black87,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              onTap(screenName: "quiz");
            },
            label: const Text(
              'Open Quiz',
            ),
            icon: const Icon(
              Icons.arrow_forward,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              iconColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
