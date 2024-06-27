import 'package:amit/game.dart';
import 'package:amit/game2.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class FirstTheme extends StatefulWidget {
  const FirstTheme({super.key});

  @override
  State<FirstTheme> createState() => _FirstThemeState();
}

class _FirstThemeState extends State<FirstTheme> {
  String title = '';
  bool tex = false;
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.asset('assets/balaha.mp4')
    //   ..addListener(() {
    //     setState(() {});
    //   })
    //   //  ..setLooping(true)
    //   ..initialize().then((_) {
    //     controller.play();
    //     setState(() {});
    //   });
    // Platform.isIOS
    //     ? {SharedPreferenceAppGroup.setAppGroup('ahmedhamdy.com.example.amit')}
    //     : null;
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Wakelock.enable();
    final size = MediaQuery.of(context).size;
    title = 'Mexicano\'s roulette';

    return Scaffold(
      // drawer: AppDrawerr(),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Container(
      //     width: //20
      //         size.width * 0.9,
      //     alignment: Alignment.centerLeft,
      //     child: Text(
      //       textAlign: TextAlign.center,
      //       title,
      //       overflow: TextOverflow.ellipsis,
      //       style: TextStyle(
      //           letterSpacing: size.width * 0.28 / title.length,
      //           fontSize: size.height * 0.3 / title.length,
      //           color: Colors.white,
      //           fontFamily: 'Aclonica',
      //           fontWeight: FontWeight.w600,
      //           fontStyle: FontStyle.normal),
      //     ),
      //   ),
      //   backgroundColor: Colors.indigo.shade500,
      //   toolbarHeight: size.height * 0.1,
      //   //   leadingWidth: double.infinity,
      //   bottom: PreferredSize(
      //     preferredSize: size * 0.08,
      //     child: Container(
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //             color: Colors.indigo.shade400,
      //             boxShadow: const [
      //               BoxShadow(
      //                   color: Color.fromARGB(27, 0, 0, 0),
      //                   spreadRadius: 0.8,
      //                   offset: Offset(0, 4))
      //             ]),
      //         width: double.infinity,
      //         height: size.height * 0.12,
      //         child: // controller.value.isInitialized
      //             //     ?
      //             Container(
      //           width: size.width * 0.17,
      //           constraints: BoxConstraints(maxHeight: size.height * 0.24),
      //           padding: const EdgeInsets.all(0),
      //           //    margin: const EdgeInsets.only(left: 5, right: 5),
      //           decoration: BoxDecoration(
      //             color: Colors.white.withOpacity(0.0),
      //             // borderRadius:
      //             //     const BorderRadius.all(Radius.circular(7.0)),
      //           ),
      //           // child: GestureDetector(
      //           //   onTap: () {
      //           //     controller.play();
      //           //   },
      //           child: ClipOval(
      //               child: Image.asset(
      //             'assets/balahax.jpeg',
      //             fit: BoxFit.contain,
      //           ) // VideoPlayer(controller)
      //               //  color: Color.fromARGB(255, 226, 219, 157),
      //               //  ),
      //               ),
      //         )
      //         // ClipRRect(
      //         //                           borderRadius: BorderRadius.circular(20.0),
      //         //                           child: VideoPlayer(controller)))
      //         //    : Text('🫘')
      //         ),
      //   ),
      // ),
//
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Game();
                }));
              },
              child: Container(
                  //    margin: const EdgeInsets.only(top: 20, bottom: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade400.withOpacity(0.5),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(27, 0, 0, 0),
                          spreadRadius: 0.8,
                          offset: Offset(0, 4)),
                    ],
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  width: size.width * 0.5,
                  height: size.height * 0.12,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedTextKit(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Game();
                          }));
                        },
                        animatedTexts: [
                          ScaleAnimatedText(
                            'Mexicano\'s Save!',
                            textAlign: TextAlign.center,
                            scalingFactor: 2,
                            textStyle: GoogleFonts.aclonica(
                                fontSize: 7,
                                fontWeight: FontWeight.w200,
                                fontStyle: FontStyle.italic),
                            duration: Duration(milliseconds: 1500),
                          ),
                          ScaleAnimatedText(
                            'Mexicano\'s Save!',
                            textAlign: TextAlign.center,
                            scalingFactor: 0.5,
                            textStyle: GoogleFonts.aclonica(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                fontStyle: FontStyle.italic),
                            duration: Duration(milliseconds: 1500),
                          ),
                        ],
                        repeatForever: true,
                        pause: Duration(milliseconds: 50),
                        // isRepeatingAnimation: false,
                        onNext: (p0, p1) {
                          setState(() {});
                        },
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Game2();
                }));
              },
              child: Container(
                  //  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade400.withOpacity(0.5),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(27, 0, 0, 0),
                          spreadRadius: 0.8,
                          offset: Offset(0, 4)),
                    ],
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  width: size.width * 0.5,
                  height: size.height * 0.12,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedTextKit(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Game2();
                          }));
                        },
                        animatedTexts: [
                          ScaleAnimatedText(
                            'Mexicano\'s Hit!',
                            textAlign: TextAlign.center,
                            scalingFactor: 2,
                            textStyle: GoogleFonts.aclonica(
                                fontSize: 7,
                                fontWeight: FontWeight.w200,
                                fontStyle: FontStyle.italic),
                            duration: Duration(milliseconds: 1500),
                          ),
                          ScaleAnimatedText(
                            'Mexicano\'s Hit!',
                            textAlign: TextAlign.center,
                            scalingFactor: 0.5,
                            textStyle: GoogleFonts.aclonica(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                fontStyle: FontStyle.italic),
                            duration: Duration(milliseconds: 1500),
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
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}