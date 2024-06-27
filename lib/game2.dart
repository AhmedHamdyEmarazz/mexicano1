import 'dart:io';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Game2 extends StatefulWidget {
  const Game2({super.key});

  @override
  State<Game2> createState() => _Game2State();
}

class _Game2State extends State<Game2> {
  final player = AssetsAudioPlayer();
  final player2 = AssetsAudioPlayer();
  bool pause1 = false;
  bool pause2 = false;
  bool pause3 = false;
  bool first = false;
  bool first2 = false;
  bool mute = false;

  Random random = new Random();
  String? imgPath;
  String? imgPath2;
  String? imgPath3;
  String? imgPath4;
  String? imgPath5;
  String? imgPath6;
  String? imgPath7;

  bool? hard;
  bool? fallingObject;
  bool? sparkObject;
  bool? TargetSmall;

//   void music1(bool pausee) async {
//     if (pausee) {
//       player.open(
//         Audio("assets/balaha1.mp3"),
//       );
//       player.playOrPause();
//     } else
// //  await player.play(UrlSource(
// //             'https://dld3.dldnw.click/dl?hash=i7jWsdZVyV0Lgt5%2BA%2BIjOsbhQsYziROfNIo7PWrfPWZDz748gNr%2Fe3nQ4uZZ2FFGe15%2F0blpnCzbaeOBWW7tdDTAxDOXmTF1mEKj6tC8g7j5iseARgXStXL%2BpRRKZEA1nd9otxmeDgYSyxMubYtmZ0PeZ94eGy%2BK1RaZygMarRvDeerYXDNn%2FCKzmF38sgprH56s%2Fa9t4w%2BCmsaQotMWEFRAWA%2FA5I2pgvFeoZE4HTnkJJEgpIIwcb3Ufls8DXBE'))
//     {
//       player.pause();
//     }
// //player.pause();
//   }

  @override
  void initState() {
    super.initState();
    pause1;
    pause2;
    pause3;
    first;
    first2;
    mute;
    get1();
    get2();
    get3();
    get4();
    get5();
    get6();
    get7();
  }

  @override
  Future<void> dispose() async {
    super.dispose(); //change here
    await player2.stop();
  }

  bool bigger = true;
  bool biggerr = true;

  bool opa = false;
  bool opaa = false;
  bool surprise = false;
  bool ghost = false;
  bool move = false;
  bool fly = false;
  bool slap = false;
  bool change = false;

  bool hold = false;
  int num = 2;
  var i;
  String bird = Platform.isAndroid ? '🧛🏻‍♂️' : '🧙‍♀️';

  String title = '';
  void count() {
    for (i = 2; i > 0; i--) {
      Future.delayed(const Duration(milliseconds: 750), () {
        setState(() {
          num = i - 1;
        });
      });
      print(i);
    }
  }

  List<int> rand = [
    300,
    400,
    500,
    700,
    700,
    500,
    300,
    400,
    400,
    1000,
    1500,
    2000,
    2500,
    300,
    600,
    600,
    400,
    700,
    800,
    800,
    850,
    900,
    990,
  ];
  int next(int min, int max) => min + random.nextInt(max - min);
  void get1() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath = prefs.getString("image1") == null
          ? imgPath2 = prefs.getString("image2") == null
              ? 'null'
              : prefs.getString("image2")
          : prefs.getString("image1");
      hard = (prefs.getBool("hard") == null) || (prefs.getBool("hard") == false)
          ? false
          : true;
      fallingObject = (prefs.getBool("fallingObject") == null) ||
              (prefs.getBool("fallingObject") == false)
          ? false
          : true;
      sparkObject = (prefs.getBool("sparkObject") == null) ||
              (prefs.getBool("sparkObject") == false)
          ? false
          : true;

      TargetSmall = (prefs.getBool("TargetSmall") == null) ||
              (prefs.getBool("TargetSmall") == false)
          ? false
          : true;
    });
  }

  void get2() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath2 = prefs.getString("image2") == null
          ? imgPath = prefs.getString("image1") == null
              ? 'null'
              : prefs.getString("image1")
          : prefs.getString("image2");
    });
  }

  void get3() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath3 = prefs.getString("image3") == null
          ? 'null'
          : prefs.getString("image3");
    });
  }

  void get4() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath4 = prefs.getString("image4") == null
          ? 'null'
          : prefs.getString("image4");
    });
  }

  void get5() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath5 = prefs.getString("image5") == null
          ? 'null'
          : prefs.getString("image5");
    });
  }

  void get6() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath6 = prefs.getString("image6") == null
          ? imgPath3 = prefs.getString("image3") == null
              ? 'null'
              : prefs.getString("image3")
          : prefs.getString("image6");
    });
  }

  void get7() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath7 = prefs.getString("image7") == null
          ? imgPath3 = prefs.getString("image2") == null
              ? 'null'
              : prefs.getString("image2")
          : prefs.getString("image7");
    });
  }

  Future<List> picsx() async {
    List pics = [];
    setState(() {
      hard! && opa && slap && !change ? slap = false : null;
      pics.add(opa && slap && !change);
    });
    return pics;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int randomNumber = random.nextInt(90) + 10;

    title = 'Mexicano\'s Hit';

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                mute = !mute;
              });
            },
            icon: Icon(
              !mute ? Icons.music_note_rounded : Icons.music_off_rounded,
              color: Colors.white,
            ),
          )
        ],
        // actions: <Widget>[
        //   const SizedBox(
        //     width: 20,
        //   ),
        //   IconButton(
        //     icon: Icon(
        //       !pause2 ? Icons.music_note_sharp : Icons.music_off,
        //       size: size.height * 0.05,
        //       color: Colors.white,
        //     ),
        //     onPressed: () async {
        //       if (first2 == true) {
        //         player2.playOrPause();
        //         player2.loopMode;
        //       }
        //       if (first2 == false) {
        //         player2.open(
        //           Audio("assets/balahax.mp3"),
        //         );
        //       }

        //       setState(() {
        //         first2 = true;
        //         pause2 = !pause2;

        //       });

        //     },
        //   )
        // ],
        centerTitle: true,
        title: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Text(
                ghost ? 'Ghost mode' : 'Ghost mode ?',
                textAlign: TextAlign.center,
                //    overflow: TextOverflow.visible,
                style: TextStyle(
                    letterSpacing: size.width * 0.18 / title.length,
                    fontSize: size.height * 0.17 / title.length,
                    fontFamily: 'Aclonica',
                    color: ghost ? Colors.red : Colors.white.withOpacity(0.3)),
              ),
              // SizedBox(
              //   width: 5,
              // child:
              Switch(
                activeTrackColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    ghost = !ghost;
                  });
                },
                value: ghost,
              ),
              // ),
            ],
          ),
        ),

        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     AnimatedTextKit(
        //       animatedTexts: [
        //         ScaleAnimatedText(
        //           !ghost ? '☠️\nGhost Mode?' : 'normal mode?',
        //           textAlign: TextAlign.center,
        //           scalingFactor: 2,
        //           textStyle: GoogleFonts.aclonica(
        //               color: !ghost ? Colors.red : Colors.green,
        //               fontSize: 8,
        //               fontWeight: FontWeight.w200,
        //               fontStyle: FontStyle.italic),
        //           duration: Duration(milliseconds: 1500),
        //         ),
        //         ScaleAnimatedText(
        //           !ghost ? '☠️\nGhost Mode?' : 'normal mode?',
        //           textAlign: TextAlign.center,
        //           scalingFactor: 0.5,
        //           textStyle: GoogleFonts.aclonica(
        //               color: !ghost ? Colors.red : Colors.green,
        //               fontSize: size.height < 300 ? 8 : 13,
        //               fontWeight: FontWeight.w200,
        //               fontStyle: FontStyle.italic),
        //           duration: Duration(milliseconds: 1500),
        //         ),
        //       ],
        //       repeatForever: true,
        //       pause: Duration(milliseconds: 50),
        //       // isRepeatingAnimation: false,
        //       onNext: (p0, p1) {
        //         setState(() {});
        //       },
        //     ),
        //     InkWell(
        //       splashColor: ghost ? Colors.green : Colors.red,
        //       hoverColor: ghost ? Colors.green : Colors.red,
        //       highlightColor: ghost ? Colors.green : Colors.red,
        //       focusColor: ghost ? Colors.green : Colors.red,
        //       onTap: () {
        //         setState(() {
        //           ghost = !ghost;
        //         });
        //       },
        //       child: Container(
        //         width: size.width * 0.4,
        //         height: size.height * 0.08,
        //         padding: const EdgeInsets.all(2),
        //         decoration: BoxDecoration(
        //           // color: Colors.white.withOpacity(0.0),
        //           border: Border.all(color: Colors.blueGrey),
        //           borderRadius:
        //               const BorderRadius.all(Radius.circular(7.0)),
        //         ),
        //         alignment: Alignment.center,
        //       ),
        //     ),
        //   ],
        // ),

//             GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     opa = false;

//                     move = !move;
//                     opaa = false;
//                     fly = true;
//                     slap = false;
//                     hold = false;
//                     num = 2;
//                     bird = Platform.isAndroid ? '🧛🏻‍♂️' : '🧙‍♀️';
//                     biggerr = true;
//                     random = new Random();
//                     print('hello');
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     // color: Colors.white.withOpacity(0.0),
//                     border: Border.all(color: Colors.blueGrey),
//                     borderRadius: const BorderRadius.all(Radius.circular(7.0)),
//                   ),
//                   child: move
//                       ? Text(
//                           'restart?',
//                           style: TextStyle(
//                             fontSize: size.height < 300 ? 10 : 16,
//                             color: Colors.white,
//                           ),
//                         )
//                       : AnimatedTextKit(
//                           onTap: () {
//                             setState(() {
//                               opa = false;

//                               move = !move;
//                               opaa = false;
//                               fly = true;
//                               slap = false;
//                               hold = false;
//                               random = new Random();
//                               num = 2;
//                               bird = Platform.isAndroid ? '🧛🏻‍♂️' : '🧙‍♀️';
//                               biggerr = true;
//                               print('hello');
//                             });
//                           },
// //
//                           animatedTexts: [
//                             ScaleAnimatedText(
//                               'START !',
//                               textAlign: TextAlign.center,
//                               scalingFactor: 2,
//                               textStyle: GoogleFonts.aclonica(
//                                   color: Colors.white,
//                                   fontSize: 8,
//                                   fontWeight: FontWeight.w200,
//                                   fontStyle: FontStyle.italic),
//                               duration: Duration(milliseconds: 1500),
//                             ),
//                             ScaleAnimatedText(
//                               'START !',
//                               textAlign: TextAlign.center,
//                               scalingFactor: 0.5,
//                               textStyle: GoogleFonts.aclonica(
//                                   color: Colors.white,
//                                   fontSize: size.height < 300 ? 10 : 16,
//                                   fontWeight: FontWeight.w200,
//                                   fontStyle: FontStyle.italic),
//                               duration: Duration(milliseconds: 1500),
//                             ),
//                           ],
//                           repeatForever: true,
//                           pause: Duration(milliseconds: 50),
//                           // isRepeatingAnimation: false,
//                           onNext: (p0, p1) {
//                             setState(() {
//                               //  tex = !tex;
//                             });
//                           },
//                         ),
//                 )),

        backgroundColor: Colors.indigo.shade500,
        toolbarHeight: size.height * 0.14,
        //  leadingWidth: 0,
        bottom: PreferredSize(
          preferredSize: size * 0.08,
          child: SafeArea(
            child: Platform.isIOS
                ? Text(
                    textAlign: TextAlign.center,
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: size.width * 0.28 / title.length,
                        fontSize: size.height * 0.3 / title.length,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Aclonica',
                        fontStyle: FontStyle.normal),
                  )
                : Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(27, 0, 0, 0),
                              spreadRadius: 0.8,
                              offset: Offset(0, 4))
                        ]),
                    width: size.width, //double.infinity,
                    height: size.height * 0.12,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: //20
                              size.width * 0.06,
                        ),
                        Container(
                          width: //20
                              size.width * 0.9,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.center,
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                letterSpacing: size.width * 0.28 / title.length,
                                fontSize: size.height * 0.3 / title.length,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Aclonica',
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
      body: FutureBuilder<List>(
          future: picsx(),
          builder: (context, snapshot) {
            // snapshot.data!.isNotEmpty
            //     ? {
            //         slap = false,
            //         snapshot.data!.clear(),
            //       }
            //     : null;
            return Column(
              children: [
                Container(
                  height: size.height * 0.04,
                  color: Colors.blue.withOpacity(0.3),
                  child: SizedBox.expand(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            ColorizeAnimatedText(
                              '☠️',
                              textStyle: TextStyle(fontSize: hard! ? 30 : 1),
                              colors: [
                                Colors.redAccent.withOpacity(hard! ? 0.7 : 0),
                                Colors.red.withOpacity(hard! ? 0.7 : 0),
                              ],
                            ),
                          ],
                          onNext: (p0, p1) {
                            ghost
                                ? setState(() {
                                    surprise = !surprise;
                                  })
                                : null;
                            //    print(surprise);
                          },
                          pause: const Duration(milliseconds: 1000),
                          repeatForever: true,
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            ColorizeAnimatedText(
                              '',
                              textStyle: const TextStyle(fontSize: 14),
                              colors: [
                                Colors.blue.withOpacity(0.3),
                                Colors.blue.withOpacity(0.3),
                              ],
                            ),
                          ],
                          //   pause: const Duration(seconds: 4),
                          repeatForever: true,
                          onNext: (p0, p1) {
                            setState(() {
                              //     player2.stopped ? pause2 = false : null;
                              player2.stopped
                                  ? player2.open(
                                      Audio("assets/balahax.mp3"),
                                    )
                                  : null;
                            });
                            // !opa
                            //     ? setState(() {
                            //         slap = false;
                            //       })
                            //     : null;
                            !move
                                ? setState(() {
                                    opaa = false;
                                  })
                                : null;
                            fly
                                ? setState(() {
                                    biggerr = !biggerr;
                                    bird = biggerr == false ? '٨' : 'v';
                                  })
                                : null;
                          },
                        ),
                        // move
                        //     ? AnimatedTextKit(
                        //         animatedTexts: [
                        //           ColorizeAnimatedText(
                        //             'Super Balaha',
                        //             textStyle: const TextStyle(fontSize: 14),
                        //             colors: [
                        //               Colors.blue.withOpacity(0.7),
                        //               Colors.blue.withOpacity(0.0),
                        //             ],
                        //           ),
                        //         ],
                        //         //   pause: const Duration(seconds: 4),
                        //         repeatForever: true,
                        //         onNext: (p0, p1) {
                        //           hold
                        //               ? setState(() {
                        //                   hold = false;
                        //                 })
                        //               : null;
                        //         },
                        //       )
                        //     : Text(''),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.12,
                  //   color: Colors.blue.withOpacity(0.3),
                  child: Stack(children: [
                    Center(
                      child: Container(
                        color: Colors.blue.withOpacity(0.3),
                        // height: 5,
                        width: size.width,
                      ),
                    ),
                    AnimatedPositioned(
                      onEnd: () {
                        setState(() {
                          opaa = true;
                          fly = false;
                        });
                        // Future.delayed(const Duration(seconds: 3), () {
                        //   setState(() {
                        //     move = !move;
                        //   });
                        // });
                      },
                      left: !move ? 0 : size.width, // * 0.9,
                      duration: move
                          ? const Duration(seconds: 4)
                          : const Duration(seconds: 0),
                      child: AnimatedOpacity(
                          onEnd: () {
                            //   opaa = true;
                          },
                          opacity: opaa ? 0.3 : 1,
                          duration: const Duration(seconds: 1),
                          child: GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   move = !move;
                              //   opa = false;
                              //   opaa = false;
                              //   fly = true;
                              //   print('hello');
                              // });
                              // Future.delayed(const Duration(seconds: 3), () {
                              //   setState(() {
                              //     opa = true;
                              //   });
                              // });
                            },
                            child: AnimatedContainer(
                              alignment: !biggerr
                                  ? Alignment.topCenter
                                  : Alignment.bottomCenter,
                              curve: Curves.easeInOutCirc,
                              duration: const Duration(milliseconds: 100),
                              height: !biggerr
                                  ? size.height * 0.06
                                  : size.height * 0.11,
                              child: Text(
                                bird,
                                style: TextStyle(
                                    fontSize: size.height * 0.06,
                                    color: Colors.black),
                              ),
                            ),
                          )),
                    ),
                  ]),
                ),

                Stack(children: [
                  //   Expanded(
                  //     child:
                  GestureDetector(
                    onTap: () async {
                      print(first);
                      // !first
                      //     ? setState(() {
                      //         first = true;
                      //         pause1 = !pause1;
                      //       })
                      //     : setState(() {
                      //         pause1 = !pause1;
                      //       });
                      if (!mute) {
                        if (first == true && !opa && move && !hold) {
                          setState(() {
                            pause1 = !pause1;
                          });
                          // player.open(
                          //   Audio("assets/balahaz.mp3"),
                          // );
                          player.playOrPause();
                        }
                        if (first == false && !opa && move && !hold) {
                          setState(() {
                            first = true;
                            pause1 = !pause1;
                          });
                          player.open(
                            Audio("assets/balahaz.mp3"),
                          );
                        }
                      }
                      !opa && move && !hold
                          ? setState(() {
                              slap = !slap;
                              hold = true;
                            })
                          : null;
                    },
                    child: Container(
                        width: size.width,
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                          color: slap && change
                              ? Colors.red.withOpacity(0.1)
                              : Colors.white.withOpacity(0.1),
                        ),
                        child: AnimatedOpacity(
                          opacity: //!opa || !move  ? 0.0 : 1,
                              //        opa && move ? 1 : 0.0,
                              0.7,
                          // onEnd: () {
                          //   setState(() {
                          //     opa && slap && !change ? slap = false : null;
                          //   });
                          // },
                          duration: const Duration(milliseconds: 100),
                          child: Stack(
                            children: [
                              Center(
                                  child: Text('Tap on white !',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: size.width * 0.11,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Aclonica',

                                        color: Colors.greenAccent.withOpacity(
                                            !opa && move
                                                ? 1
                                                : 0.0), // !opa && move ? 1 : 0.0,
                                      ))),
                              Center(
                                child: AnimatedTextKit(
                                  onTap: () async {
                                    print(first);
                                    // !first
                                    //     ? setState(() {
                                    //         first = true;
                                    //         pause1 = !pause1;
                                    //       })
                                    //     : setState(() {
                                    //         pause1 = !pause1;
                                    //       });
                                    if (!mute) {
                                      if (first == true &&
                                          !opa &&
                                          move &&
                                          !hold) {
                                        setState(() {
                                          pause1 = !pause1;
                                        });
                                        // player.open(
                                        //   Audio("assets/balahaz.mp3"),
                                        // );
                                        player.playOrPause();
                                      }
                                      if (first == false &&
                                          !opa &&
                                          move &&
                                          !hold) {
                                        setState(() {
                                          first = true;
                                          pause1 = !pause1;
                                        });
                                        player.open(
                                          Audio("assets/balahaz.mp3"),
                                        );
                                      }
                                    }
                                    !opa && move && !hold
                                        ? setState(() {
                                            slap = !slap;
                                            hold = true;
                                          })
                                        : null;
                                  },

                                  animatedTexts: [
                                    ScaleAnimatedText(
                                      'Tap on white !',
                                      textAlign: TextAlign.center,
                                      scalingFactor: 2,
                                      textStyle: GoogleFonts.aclonica(
                                          color: Colors.greenAccent.withOpacity(
                                              !opa && move
                                                  ? 1
                                                  : 0.0), // !opa && move ? 1 : 0.0,
                                          fontSize: size.width * 0.15,
                                          fontWeight: FontWeight.w200,
                                          fontStyle: FontStyle.italic),
                                      duration: Duration(milliseconds: 1500),
                                    ),
                                    ScaleAnimatedText(
                                      'Tap on white !',
                                      textAlign: TextAlign.center,
                                      scalingFactor: 0.5,
                                      textStyle: GoogleFonts.aclonica(
                                          color: Colors.greenAccent.withOpacity(
                                              !opa && move
                                                  ? 1
                                                  : 0.0), // !opa && move ? 1 : 0.0,
                                          fontSize: size.width * 0.11,
                                          fontWeight: FontWeight.w200,
                                          fontStyle: FontStyle.italic),
                                      duration: Duration(milliseconds: 1500),
                                    ),
                                  ],
                                  repeatForever: true,
                                  pause: Duration(milliseconds: 50),
                                  // isRepeatingAnimation: false,
                                  onNext: (p0, p1) {
                                    // setState(() {
                                    //   opa && slap && !change ? slap = false : null;
                                    // });
                                  },
                                ),
                              ),
                              Center(
                                  child: Text(
                                hard!
                                    ? slap && change
                                        ? 'You Win'
                                        : 'Game Over'
                                    : slap
                                        ? 'You Win'
                                        : 'Game Over',
                                style: TextStyle(
                                    fontSize: size.width * 0.11,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Aclonica',
                                    color: Colors.redAccent
                                        .withOpacity(opa && move ? 1 : 0.0)),
                              )),
                            ],
                          ),
                        )),
                  ),
                  //    ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          width: size.width,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.3),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              opa = false;

                              move = !move;
                              opaa = false;
                              fly = true;
                              slap = false;
                              change = false;
                              hold = false;
                              num = 2;
                              bird = Platform.isAndroid ? '🧛🏻‍♂️' : '🧙‍♀️';
                              biggerr = true;
                              random = new Random();
                              print('hello');
                            });
                          },
                          child: InkWell(
                            splashColor: !move ? Colors.green : Colors.red,
                            hoverColor: !move ? Colors.green : Colors.red,
                            highlightColor: !move ? Colors.green : Colors.red,
                            focusColor: !move ? Colors.green : Colors.red,
                            onTap: () {
                              setState(() {
                                opa = false;

                                move = !move;
                                opaa = false;
                                fly = true;
                                slap = false;
                                change = false;

                                hold = false;
                                num = 2;
                                bird = Platform.isAndroid ? '🧛🏻‍♂️' : '🧙‍♀️';
                                biggerr = true;
                                random = new Random();
                                print('hello');
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: size.height * 0.1,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                // color: Colors.white.withOpacity(0.0),
                                border: Border.all(color: Colors.blueGrey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(7.0)),
                              ),
                              child: move
                                  ? Text(
                                      'restart?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: size.height < 300 ? 10 : 16,
                                        fontFamily: 'Aclonica',
                                        color: Colors.red,
                                      ),
                                    )
                                  : AnimatedTextKit(
                                      onTap: () {
                                        setState(() {
                                          opa = false;

                                          move = !move;
                                          opaa = false;
                                          fly = true;
                                          slap = false;
                                          change = false;

                                          hold = false;
                                          random = new Random();
                                          num = 2;
                                          bird = Platform.isAndroid
                                              ? '🧛🏻‍♂️'
                                              : '🧙‍♀️';
                                          biggerr = true;
                                          print('hello');
                                        });
                                      },

                                      animatedTexts: [
                                        ScaleAnimatedText(
                                          'START !',
                                          textAlign: TextAlign.center,
                                          scalingFactor: 2,
                                          textStyle: GoogleFonts.aclonica(
                                              color: Colors.green,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w200,
                                              fontStyle: FontStyle.italic),
                                          duration:
                                              Duration(milliseconds: 1500),
                                        ),
                                        ScaleAnimatedText(
                                          'START !',
                                          textAlign: TextAlign.center,
                                          scalingFactor: 0.5,
                                          textStyle: GoogleFonts.aclonica(
                                              color: Colors.green,
                                              fontSize:
                                                  size.height < 300 ? 10 : 16,
                                              fontWeight: FontWeight.w200,
                                              fontStyle: FontStyle.italic),
                                          duration:
                                              Duration(milliseconds: 1500),
                                        ),
                                      ],
                                      repeatForever: true,
                                      pause: Duration(milliseconds: 50),
                                      // isRepeatingAnimation: false,
                                      onNext: (p0, p1) {
                                        setState(() {
                                          //  tex = !tex;
                                        });
                                      },
                                    ),
                            ),
                          )),
                      // AnimatedTextKit(
                      //   animatedTexts: [
                      //     ScaleAnimatedText(
                      //       !ghost ? '☠️\nGhost Mode?' : 'normal mode?',
                      //       textAlign: TextAlign.center,
                      //       scalingFactor: 2,
                      //       textStyle: GoogleFonts.aclonica(
                      //           color: !ghost ? Colors.red : Colors.green,
                      //           fontSize: 8,
                      //           fontWeight: FontWeight.w200,
                      //           fontStyle: FontStyle.italic),
                      //       duration: Duration(milliseconds: 1500),
                      //     ),
                      //     ScaleAnimatedText(
                      //       !ghost ? '☠️\nGhost Mode?' : 'normal mode?',
                      //       textAlign: TextAlign.center,
                      //       scalingFactor: 0.5,
                      //       textStyle: GoogleFonts.aclonica(
                      //           color: !ghost ? Colors.red : Colors.green,
                      //           fontSize: size.height < 300 ? 8 : 13,
                      //           fontWeight: FontWeight.w200,
                      //           fontStyle: FontStyle.italic),
                      //       duration: Duration(milliseconds: 1500),
                      //     ),
                      //   ],
                      //   repeatForever: true,
                      //   pause: Duration(milliseconds: 50),
                      //   // isRepeatingAnimation: false,
                      //   onNext: (p0, p1) {
                      //     setState(() {});
                      //   },
                      // ),
                      // InkWell(
                      //   splashColor: ghost ? Colors.green : Colors.red,
                      //   hoverColor: ghost ? Colors.green : Colors.red,
                      //   highlightColor: ghost ? Colors.green : Colors.red,
                      //   focusColor: ghost ? Colors.green : Colors.red,
                      //   onTap: () {
                      //     setState(() {
                      //       ghost = !ghost;
                      //     });
                      //   },
                      //   child: Container(
                      //     width: size.width * 0.4,
                      //     height: size.height * 0.08,
                      //     padding: const EdgeInsets.all(2),
                      //     decoration: BoxDecoration(
                      //       // color: Colors.white.withOpacity(0.0),
                      //       border: Border.all(color: Colors.blueGrey),
                      //       borderRadius:
                      //           const BorderRadius.all(Radius.circular(7.0)),
                      //     ),
                      //     alignment: Alignment.center,
                      //   ),
                      // ),
                      // Positioned(
                      //   child: IconButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           opa = false;
                      //           move = !move;

                      //           opaa = false;
                      //           fly = true;
                      //           slap = false;
                      //           hold = false;
                      //           num = 2;
                      //           bird = Platform.isAndroid ? '🧛🏻‍♂️' : '🧙‍♀️';
                      //           biggerr = true;
                      //           random = new Random();
                      //           print('hello');
                      //         });
                      //       },
                      //       icon: Icon(move ? Icons.restart_alt : Icons.start)),
                      //   left: size.width * 0.85,
                      // ),
                      // Positioned(
                      //   child: IconButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           opa = false;
                      //           move = !move;

                      //           opaa = false;
                      //           fly = true;
                      //           slap = false;
                      //           hold = false;
                      //           num = 2;
                      //           bird = Platform.isAndroid ? '🧛🏻‍♂️' : '🧙‍♀️';
                      //           biggerr = true;
                      //           random = new Random();
                      //           print('hello');
                      //         });
                      //       },
                      //       icon: Icon(move ? Icons.restart_alt : Icons.start)),
                      //   right: size.width * 0.85,
                      // ),
                    ],
                  ),
                  AnimatedPositioned(
                      onEnd: () {
                        if (slap) {
                          setState(() {
                            /////////////////////////////////////////////////////////// this is the difficulty balah back speed
                            // Future.delayed(
                            //     Duration(milliseconds: random.nextInt(200) + 1000),
                            //     () {
                            //   slap = !opa ? !slap : slap;
                            // });
                            change = true;
                            slap = !opa ? !slap : slap;
                            ////////////////////////////////////////////////////////////// difficulty hold time
                            num = 2;
                          });

                          Future.delayed(const Duration(milliseconds: 1500),
                              () {
                            setState(() {
                              hold = false;
                            });
                          });
                          ////////////////////////////////////////////////////////difficulty hold function
                          count();
                          //////////////////////////////////////////
                        } else {
                          change = false;
                        }
                      },
                      /////////////////////////////////////////////////////////// this is the difficulty balah go and back speed

                      duration: Duration(milliseconds: next(50, 300)),
                      right:
                          // opa && slap && !change
                          //                     ?
                          // size.width * 0.8
                          //                     :
                          !slap ? size.width * 0.8 : size.width * 0.0,
                      // right: !slap ? size.width * 0.72 : null, //size.width * 0.00,
                      left:
                          //  opa && slap && !change
                          //                     ? size.width * 0.00
                          //                     :
                          !slap ? size.width * 0.00 : size.width * 0.72,
                      //     top: !slap ? size.height * 0.47 : size.height * 0.3,
                      bottom: !TargetSmall! ? 0 : size.height * 0.04, //  ,
                      //top:TargetSmall!? size.height:  null,
                      child: IconButton(
                        splashColor: Colors.red,
                        hoverColor: Colors.red,
                        highlightColor: Colors.red,
                        focusColor: Colors.red,
                        onPressed: () async {
                          if (first == true) {
                            player.playOrPause();
                          }
                          if (first == false) {
                            player.open(
                              Audio("assets/balahaz.mp3"),
                            );
                          }

                          setState(() {
                            first = true;
                            pause1 = !pause1;
                          });
                        },
                        icon: Container(
                          width: !TargetSmall!
                              ? size.width * 0.17
                              : size.width * 0.05 > size.height * 0.03
                                  ? size.width * 0.05
                                  : size.height * 0.03, // size.width * 0.17,
                          constraints: BoxConstraints(
                              maxHeight: !TargetSmall!
                                  ? size.height * 0.24
                                  : size.height * 0.03),

                          // width: size.width * 0.17,
                          // constraints: BoxConstraints(
                          //     maxHeight: size.height * 0.24,
                          //     maxWidth: size.width * 0.14),
                          padding: const EdgeInsets.all(0),
                          //    margin: const EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: slap
                                      ? Colors.red.withOpacity(0.7)
                                      : Colors.white.withOpacity(0.0),
                                  blurRadius: 20,
                                  spreadRadius: -0.12,
                                  offset: Offset(-6, 6))
                            ],
                            color: slap
                                ? Colors.red.withOpacity(0.5)
                                : Colors.white.withOpacity(0.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9.0),
                            child: imgPath != 'null'
                                ? Image.file(
                                    File(opa && slap && change
                                        ? imgPath2!
                                        : slap
                                            ? imgPath7!
                                            : imgPath!),
                                    fit: BoxFit.fill,
                                    //   width: size.width * 0.,
                                    height: size.height * 0.1,
                                  )
                                : Image.asset(
                                    opa && slap
                                        ? 'assets/balaha1.jpeg'
                                        : 'assets/balaha.jpeg',
                                    //   fit: BoxFit.fitHeight,
                                    fit: BoxFit.fill,

                                    height: size.height * 0.1,

                                    //  width: size.width * 0.3,
                                    //  height: size.height * 0.4,
                                  ),
                          ),
                        ),
                      )),
                  Positioned(
                    left: 0,
                    bottom: 0, //size.height * 0.03,
                    child: imgPath4 != 'null'
                        ? Column(
                            children: [
                              move && hold && !opa
                                  ? Text('🚫\n${num.abs()}',
                                      style: TextStyle(
                                        fontSize: size.width * 0.07 >
                                                size.height * 0.05
                                            ? size.width * 0.07
                                            : size.height * 0.05,
                                      ))
                                  : SizedBox(),
                              Container(
                                  width: (sparkObject! &&
                                          slap) //|| (move && hold && !opa)
                                      ? size.width * 0.17
                                      : size.width * 0.05 > size.height * 0.03
                                          ? size.width * 0.05
                                          : size.height *
                                              0.03, // size.width * 0.17,
                                  constraints: BoxConstraints(
                                      maxHeight: sparkObject! && slap
                                          ? size.height * 0.24
                                          : size.height *
                                              0.03), //size.height * 0.24),
                                  padding: const EdgeInsets.all(0),
                                  //    margin: const EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: slap
                                              ? Colors.yellow.withOpacity(0.5)
                                              : Colors.white.withOpacity(0.0),
                                          blurRadius: 8,
                                          spreadRadius: -0.8,
                                          offset: Offset(4, -4))
                                    ],
                                    color: !slap
                                        ? Colors.white.withOpacity(0.0)
                                        : Colors.yellow.withOpacity(0.7),
                                    // borderRadius:
                                    //     const BorderRadius.all(Radius.circular(7.0)),
                                  ),
                                  child: slap
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                          child: Image.file(
                                            File(imgPath4!),
                                            fit: BoxFit.fill,
                                            height: size.height * 0.1,

                                            // width: double.infinity,
                                          ))
                                      : move && hold && !opa
                                          ? Text(
                                              '🚫',
                                            )
                                          : Opacity(
                                              opacity: slap
                                                  ? 1
                                                  //                                       :
                                                  // sparkObject!
                                                  //                                           ? 0.18
                                                  : 0.6,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                  child: Image.file(
                                                    File(imgPath4!),
                                                    fit: BoxFit.fill,
                                                    height: size.height * 0.1,

                                                    // width: double.infinity,
                                                  )),
                                            )),
                            ],
                          )
                        : Text(
                            slap
                                ? '🤟'
                                : move && hold && !opa
                                    ? '🚫\n${num.abs()}'
                                    : '🖐',
                            style: TextStyle(
                                fontSize: size.width * 0.07 > size.height * 0.05
                                    ? size.width * 0.07
                                    : size.height *
                                        0.05, //(size.height * 0.03 / size.width),
                                color: slap
                                    ? Colors.yellow
                                    : move && hold && !opa
                                        ? Colors.red
                                        : Colors.yellow),
                          ),
                  ),
                  AnimatedPositioned(
                    onEnd: () {
                      setState(() {
                        opa = true;
                      });
                      // Future.delayed(const Duration(seconds: 3), () {
                      //   setState(() {
                      //     move = !move;
                      //   });
                      // });
                    },
                    left: !move ? 0 : size.width * 0.829, // 0.84,
                    //   top: !move ? 0 : size.height * 0.5,
                    bottom: move ? size.height * 0.045 : size.height * 0.5,
                    ///////////////////difficulty poop speed
                    curve: !ghost
                        ? Curves.linear
                        : !surprise
                            ? Curves.decelerate
                            : accelerateEasing,
                    duration: move
                        ? Duration(
                            milliseconds: hard!
                                ? (rand..shuffle()).first
                                : next(500, 3000))

                        //     (rand..shuffle()).first) //   next(1100, 4000))
                        : const Duration(seconds: 0),
                    child: AnimatedOpacity(
                        opacity: opa
                            ? fallingObject!
                                ? 0.7
                                : 0.66
                            : 1,
                        duration: const Duration(milliseconds: 100),
                        child: GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   move = !move;
                            //   opa = false;

                            //   print('hello');
                            // });
                            // Future.delayed(const Duration(seconds: 3), () {
                            //   setState(() {
                            //     opa = true;
                            //   });
                            // });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: imgPath5 != 'null' && opa && slap && change
                                ? Container(
                                    // width: size.width * 0.17,
                                    // constraints:
                                    //     BoxConstraints(maxHeight: size.height * 0.24),
                                    width: fallingObject!
                                        ? size.width * 0.17
                                        : size.width * 0.05 > size.height * 0.03
                                            ? size.width * 0.05
                                            : size.height *
                                                0.03, // size.width * 0.17,
                                    constraints: BoxConstraints(
                                        maxHeight: fallingObject!
                                            ? size.height * 0.24
                                            : size.height * 0.03),
                                    padding: const EdgeInsets.all(0),
                                    //    margin: const EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.deepOrange
                                                .withOpacity(0.8),
                                            blurRadius: 8,
                                            spreadRadius: -0.8,
                                            offset: Offset(4, -4))
                                      ],
                                      color: Colors.white.withOpacity(0.0),
                                      // borderRadius:
                                      //     const BorderRadius.all(Radius.circular(7.0)),
                                    ),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                        child: Image.file(
                                          File(imgPath5!),
                                          fit: BoxFit.fill,
                                          height: size.height * 0.1,

                                          // width: double.infinity,
                                        )))
                                : imgPath6 != 'null' && opa && !slap
                                    ? Container(
                                        // width: size.width * 0.17,
                                        // constraints:
                                        //     BoxConstraints(maxHeight: size.height * 0.24),
                                        width: fallingObject!
                                            ? size.width * 0.17
                                            : size.width * 0.05 >
                                                    size.height * 0.03
                                                ? size.width * 0.05
                                                : size.height *
                                                    0.03, // size.width * 0.17,
                                        constraints: BoxConstraints(
                                            maxHeight: fallingObject!
                                                ? size.height * 0.24
                                                : size.height * 0.03),
                                        padding: const EdgeInsets.all(0),
                                        //    margin: const EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.deepOrange
                                                    .withOpacity(0.8),
                                                blurRadius: 8,
                                                spreadRadius: -0.8,
                                                offset: Offset(4, -4))
                                          ],
                                          color: Colors.white.withOpacity(0.0),
                                          // borderRadius:
                                          //     const BorderRadius.all(Radius.circular(7.0)),
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                            child: Image.file(
                                              File(imgPath6!),
                                              fit: BoxFit.fill,
                                              height: size.height * 0.1,

                                              // width: double.infinity,
                                            )))
                                    : imgPath3 != 'null'
                                        ? Container(
                                            // width: size.width * 0.17,
                                            // constraints:
                                            //     BoxConstraints(maxHeight: size.height * 0.24),
                                            width: fallingObject!
                                                ? size.width * 0.17
                                                : size.width * 0.05 >
                                                        size.height * 0.03
                                                    ? size.width * 0.05
                                                    : size.height *
                                                        0.03, // size.width * 0.17,
                                            constraints: BoxConstraints(
                                                maxHeight: fallingObject!
                                                    ? size.height * 0.24
                                                    : size.height * 0.03),
                                            padding: const EdgeInsets.all(0),
                                            //    margin: const EdgeInsets.only(left: 5, right: 5),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.deepOrange
                                                        .withOpacity(0.8),
                                                    blurRadius: 8,
                                                    spreadRadius: -0.8,
                                                    offset: Offset(4, -4))
                                              ],
                                              color:
                                                  Colors.white.withOpacity(0.0),
                                              // borderRadius:
                                              //     const BorderRadius.all(Radius.circular(7.0)),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(9.0),
                                                child: Image.file(
                                                  File(imgPath3!),
                                                  fit: BoxFit.fill,
                                                  height: size.height * 0.1,

                                                  // width: double.infinity,
                                                )))
                                        : Text(
                                            !move
                                                ? ''
                                                : Platform.isAndroid
                                                    ? '💩'
                                                    : '🩴',
                                            style: TextStyle(
                                                fontSize: size.width * 0.04 >
                                                        size.height * 0.05
                                                    ? size.width * 0.04
                                                    : size.height * 0.05,

                                                //size.height * 0.05,
                                                color: opa
                                                    ? Colors.red
                                                    : Colors.brown),
                                          ),
                          ),
                        )),
                  ),
                ]),

                // IconButton(
                //     onPressed: () {
                //       setState(() {
                //         bigger = !bigger;
                //         // red = !red;
                //       });
                //     },
                //     icon: Icon(
                //       Icons.change_circle,
                //       size: 30,
                //     )),
                // // Load a Lottie file from your assets
                // Container(
                //     height: 180, child: Lottie.asset('assets/LottieLogo1.json')),

                // // Load a Lottie file from a remote url
                // Lottie.network(
                //     'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

                // // Load an animation and its images from a zip file
                // //  Lottie.asset('assets/lottiefiles/angel.zip'),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(first);
          // !first
          //     ? setState(() {
          //         first = true;
          //         pause1 = !pause1;
          //       })
          //     : setState(() {
          //         pause1 = !pause1;
          //       });
          if (!mute) {
            if (first == true && !opa && move && !hold) {
              setState(() {
                pause1 = !pause1;
              });
              // player.open(
              //   Audio("assets/balahaz.mp3"),
              // );
              player.playOrPause();
            }
            if (first == false && !opa && move && !hold) {
              setState(() {
                first = true;
                pause1 = !pause1;
              });
              player.open(
                Audio("assets/balahaz.mp3"),
              );
            }
          }
          !opa && move && !hold
              ? setState(() {
                  slap = !slap;
                  hold = true;
                })
              : null;
        },
        backgroundColor: const Color.fromARGB(47, 0, 0, 0),
        child: Icon(
          Icons.bolt,
          color: !opa && !hold && move ? Colors.yellow : Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
