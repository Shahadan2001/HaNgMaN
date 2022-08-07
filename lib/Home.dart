// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math';

int chance = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0, j = 0, map = 1;
  static List<String> list = [
    "BANANA",
    "LADIES",
    "HELPER",
    "ANGRY",
    "ACID",
    "AREA",
    "HOME",
    "ANT",
    "TWO",
    "NAME",
    "ZEBRA",
    "YALK",
    "HUMAN",
    "POLICE",
    "KITE",
    "ISLAND",
    "SOAP",
    "LIZARD",
    "CEMENT",
    "LIQUID",
    "SIMPLE",
    "MOSQUE",
    "TEMPLE",
    "CHURCH",
  ];
  static Random random = new Random();
  static int num = random.nextInt(24);
  static String s = list[num];
  String result = "";
  List<String> find = List.filled(s.length, "");
  List<bool> isButtonEnabled = List.filled(26, true, growable: false);
  List<bool> hasBeenPressed = List.filled(26, false, growable: true);
  void check() {
    int l, flag = 0;
    for (l = 0; l < s.length; l++) {
      if (s[l] != find[l]) {
        flag = 1;
        break;
      }
    }
    if (flag == 0) {
      result = "YOU WON👌";
      isButtonEnabled = List.filled(26, false, growable: true);
    }
    if (chance == 6) {
      result = "YOU LOSE😞";
      isButtonEnabled = List.filled(26, false, growable: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff0a0746),
              Color(0xff460b53),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Home()), // this mainpage is your page to refresh
                              (Route<dynamic> route) => false,
                            );
                            num = random.nextInt(24);
                            s = list[num];
                            chance = 0;
                          },
                          icon: Icon(
                            Icons.refresh_rounded,
                            color: Colors.amber,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomPaint(
                          child: Container(
                              width: 300,
                              height: 300,
                              color: Colors.transparent),
                          foregroundPainter: LinePainter(),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "$result",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (i = 0; i < s.length; i++)
                  Container(
                    height: 55,
                    width: 55,
                    child: Center(
                      child: Text(
                        "${find[i]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[0] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[0]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'A') {
                                  find[j] = 'A';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[0] = false;
                              hasBeenPressed[0] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    onPressed: isButtonEnabled[1]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'B') {
                                  find[j] = 'B';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[1] = false;
                              hasBeenPressed[1] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'B',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[2] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[2]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'C') {
                                  find[j] = 'C';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[2] = false;
                              hasBeenPressed[2] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'C',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[3] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[3]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'D') {
                                  find[j] = 'D';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[3] = false;
                              hasBeenPressed[3] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'D',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[4] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[4]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'E') {
                                  find[j] = 'E';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[4] = false;
                              hasBeenPressed[4] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'E',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[5] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[5]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'F') {
                                  find[j] = 'F';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[5] = false;
                              hasBeenPressed[5] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'F',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[6] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[6]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'G') {
                                  find[j] = 'G';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[6] = false;
                              hasBeenPressed[6] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'G',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[7] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[7]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'H') {
                                  find[j] = 'H';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[7] = false;
                              hasBeenPressed[7] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'H',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[8] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[8]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'I') {
                                  find[j] = 'I';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[8] = false;
                              hasBeenPressed[8] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'I',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[9] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[9]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'J') {
                                  find[j] = 'J';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[9] = false;
                              hasBeenPressed[9] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'J',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[10] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[10]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'K') {
                                  find[j] = 'K';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[10] = false;
                              hasBeenPressed[10] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'K',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[11] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[11]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'L') {
                                  find[j] = 'L';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[11] = false;
                              hasBeenPressed[11] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'L',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[12] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[12]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'M') {
                                  find[j] = 'M';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[12] = false;
                              hasBeenPressed[12] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'M',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[13] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[13]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'N') {
                                  find[j] = 'N';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[13] = false;
                              hasBeenPressed[13] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'N',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[14] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[14]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'O') {
                                  find[j] = 'O';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[14] = false;
                              hasBeenPressed[14] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'O',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[15] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[15]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'P') {
                                  find[j] = 'P';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[15] = false;
                              hasBeenPressed[15] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'P',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[16] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[16]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'Q') {
                                  find[j] = 'Q';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[16] = false;
                              hasBeenPressed[16] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'Q',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[17] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[17]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'R') {
                                  find[j] = 'R';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[17] = false;
                              hasBeenPressed[17] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'R',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[18] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[18]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'S') {
                                  find[j] = 'S';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[18] = false;
                              hasBeenPressed[18] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'S',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[19] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[19]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'T') {
                                  find[j] = 'T';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[19] = false;
                              hasBeenPressed[19] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'T',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[20] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[20]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'U') {
                                  find[j] = 'U';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[20] = false;
                              hasBeenPressed[20] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'U',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[21] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[21]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'V') {
                                  find[j] = 'V';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[21] = false;
                              hasBeenPressed[21] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'V',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[22] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[22]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'W') {
                                  find[j] = 'W';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[22] = false;
                              hasBeenPressed[22] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'W',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[23] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[23]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'X') {
                                  find[j] = 'X';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[23] = false;
                              hasBeenPressed[23] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'X',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[24] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[24]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'Y') {
                                  find[j] = 'Y';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[24] = false;
                              hasBeenPressed[24] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'Y',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                ButtonTheme(
                  height: 50,
                  minWidth: 50,
                  child: RaisedButton(
                    color: hasBeenPressed[25] ? Colors.grey : Colors.blue,
                    onPressed: isButtonEnabled[25]
                        ? () {
                            setState(() {
                              map = 0;
                              for (j = 0; j < s.length; j++) {
                                if (s[j] == 'Z') {
                                  find[j] = 'Z';
                                  map = 1;
                                }
                              }
                              if (map == 0) {
                                chance++;
                              }
                              isButtonEnabled[25] = false;
                              hasBeenPressed[25] = true;
                              check();
                            });
                          }
                        : null,
                    child: Text(
                      'Z',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    var paint1 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width / 4, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(0, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, 0),
      Offset(size.height / 1.5, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.height / 1.5, 0),
      Offset(size.height / 1.5, size.height / 7),
      paint,
    );
    if (chance >= 1) {
      canvas.drawCircle(
        Offset(size.height / 1.5, size.height / 3.7),
        size.width * 1 / 9,
        paint1,
      );
    }
    if (chance >= 2) {
      canvas.drawLine(
        Offset(size.height / 1.5, size.height / 1.4),
        Offset(size.height / 1.5, size.height / 2.6),
        paint,
      );
    }
    if (chance >= 3) {
      canvas.drawLine(
        Offset(size.height / 1.5, size.height / 2.3),
        Offset(size.height / 2, size.height / 2),
        paint,
      );
    }
    if (chance >= 4) {
      canvas.drawLine(
        Offset(size.height / 1.5, size.height / 2.3),
        Offset(size.height / 1.2, size.height / 1.98),
        paint,
      );
    }
    if (chance >= 5) {
      canvas.drawLine(
        Offset(size.height / 1.5, size.height / 1.4),
        Offset(size.height / 1.2, size.height / 1.3),
        paint,
      );
    }
    if (chance >= 6) {
      canvas.drawLine(
        Offset(size.height / 1.5, size.height / 1.4),
        Offset(size.height / 1.99, size.height / 1.309),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
