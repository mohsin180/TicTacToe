// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/consonants/colors.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool Oturn = true;
  final List<String> displayXO = List.filled(9, ' ');
  static var customfont = GoogleFonts.akayaKanadaka(
      textStyle: TextStyle(
    fontSize: 20,
    letterSpacing: 3,
    color: Colurs.primaryColor,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colurs.secendoryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "Score Board",
                      style: customfont,
                    )),
                Expanded(
                  flex: 3,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {tapped(index)},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colurs.accentColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 5, color: Colurs.accentColor)),
                          child: Center(
                              child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                                textStyle: TextStyle(
                              color: Colurs.primaryColor,
                              fontSize: 50,
                            )),
                          )),
                        ),
                      );
                    },
                    itemCount: 9,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "Timer Board",
                      style: customfont,
                    )),
              ],
            ),
          ),
        ));
  }

  tapped(int index) {
    setState(() {
      if (Oturn && displayXO[index] == " ") {
        displayXO[index] = "O";
      } else {
        displayXO[index] = "X";
      }
      Oturn = !Oturn;
    });
  }
}
