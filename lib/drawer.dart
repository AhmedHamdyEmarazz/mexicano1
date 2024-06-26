import 'package:amit/custompic2.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawerr extends StatefulWidget {
  @override
  _AppDrawerrState createState() => _AppDrawerrState();
}

class _AppDrawerrState extends State<AppDrawerr> {
  @pragma('vm:entry-point')
  bool? hard;
  bool? fallingObject;
  bool? sparkObject;
  bool? TargetSmall;
  String? imgPath;
  String? imgPath2;
  String? imgPath3;
  String? imgPath4;
  String? imgPath5;
  void get1() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hard = (prefs.getBool("hard") == null) || (prefs.getBool("hard") == false)
          ? false
          : true;
      imgPath = prefs.getString("image1") == null
          ? 'null'
          : prefs.getString("image1");
      imgPath2 = prefs.getString("image2") == null
          ? 'null'
          : prefs.getString("image2");
      imgPath3 = prefs.getString("image3") == null
          ? 'null'
          : prefs.getString("image3");
      imgPath4 = prefs.getString("image4") == null
          ? 'null'
          : prefs.getString("image4");
    });
    print(prefs.getBool("hard"));
  }

  void get2() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fallingObject = (prefs.getBool("fallingObject") == null) ||
              (prefs.getBool("fallingObject") == false)
          ? false
          : true;
    });
    print(prefs.getBool("fallingObject"));
  }

  void get3() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sparkObject = (prefs.getBool("sparkObject") == null) ||
              (prefs.getBool("sparkObject") == false)
          ? false
          : true;
    });
    print(prefs.getBool("sparkObject"));
  }

  void get4() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      TargetSmall = (prefs.getBool("TargetSmall") == null) ||
              (prefs.getBool("TargetSmall") == false)
          ? false
          : true;
    });
    print(prefs.getBool("TargetSmall"));
  }

  void save1(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("hard", hard!);
    });
  }

  void save2(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("fallingObject", fallingObject!);
    });
  }

  void save3(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("sparkObject", sparkObject!);
    });
  }

  void save4(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("TargetSmall", TargetSmall!);
    });
  }

  @override
  void initState() {
    super.initState();

    get1();
    get2();
    get3();
    get4();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final eight = size.width * 0.8;
    return Drawer(
        width: eight,
        child: Container(
            height: size.height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //  Icon(Icons.ac_unit)
                  AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        '',
                        textStyle: const TextStyle(fontSize: 1),
                        colors: [
                          Colors.blue.withOpacity(0.0),
                          Colors.blue.withOpacity(0.0),
                        ],
                      ),
                    ],
                    onNext: (p0, p1) {
                      setState(() {
                        get1();
                        get2();
                        get3();
                        get4();
                      });

                      //    print(surprise);
                    },
                    pause: const Duration(milliseconds: 1000),
                    repeatForever: true,
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Color.fromARGB(255, 252, 250, 250),
                    foregroundColor: Colors.black,
                    centerTitle: true,
                    toolbarHeight: 80,
                    title: Center(
                        child: SizedBox(
                            //   height: 100,
                            //   width: double.infinity,
                            child: Image.asset(
                      'assets/balahax.jpeg',
                      fit: BoxFit.contain,
                    ))),
                    automaticallyImplyLeading: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
//                   Center(
//                       child: Padding(
//                           padding: EdgeInsets.fromLTRB(
//                               eight * 0.1, 3, eight * 0.1, 3),
//                           child: ListTile(
//                               tileColor:
//                                   const Color.fromARGB(46, 158, 158, 158),
//                               splashColor: Colors.amber,
//                               leading: const Icon(Icons.photo),
//                               //      minLeadingWidth: 100,
//                               title: Center(
//                                   child: const Text(
//                                 'customize target',
//                                 textAlign: TextAlign.center,
//                                 //    overflow: TextOverflow.visible,
//                                 style: const TextStyle(
//                                   fontFamily: 'Aclonica',
//                                 ),
//                               )),
//                               onTap: () async {
//                                 Future.delayed(
//                                     const Duration(milliseconds: 500), (() {
//                                   Navigator.pushReplacement(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return CustomPic();
//                                   }));
//                                 }));
//                               }))),
//                   //  const Divider(),
//                   SizedBox(
//                     height: 20,
//                   ),
// //
//                   Center(
//                       child: Padding(
//                           padding: EdgeInsets.fromLTRB(
//                               eight * 0.1, 3, eight * 0.1, 3),
//                           child: ListTile(
//                               tileColor:
//                                   const Color.fromARGB(46, 158, 158, 158),
//                               splashColor: Colors.amber,
//                               leading: const Icon(Icons.home_filled),
//                               //      minLeadingWidth: 100,
//                               title: Center(
//                                   child: const Text(
//                                 'Home page',
//                                 textAlign: TextAlign.center,
//                                 //    overflow: TextOverflow.visible,
//                                 style: const TextStyle(
//                                   fontFamily: 'Aclonica',
//                                 ),
//                               )),
//                               onTap: () async {
//                                 Future.delayed(
//                                     const Duration(milliseconds: 500), (() {
//                                   Navigator.pushReplacement(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return FirstTheme();
//                                   }));
//                                 }));
//                               }))),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              eight * 0.1, 3, eight * 0.1, 3),
                          child: ListTile(
                              tileColor:
                                  const Color.fromARGB(46, 158, 158, 158),
                              splashColor: Colors.amber,
                              leading: const Icon(Icons.photo),
                              //      minLeadingWidth: 100,
                              title: Center(
                                  child: const Text(
                                'customize objects',
                                textAlign: TextAlign.center,
                                //    overflow: TextOverflow.visible,
                                style: const TextStyle(
                                  fontFamily: 'Aclonica',
                                ),
                              )),
                              onTap: () async {
                                Future.delayed(
                                    const Duration(milliseconds: 500), (() {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CustomPic2();
                                  }));
                                }));
                              }))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Text(
                          'Hard ?', textAlign: TextAlign.center,
                          //    overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Aclonica',
                              color: hard!
                                  ? Colors.red
                                  : Colors.red.withOpacity(0.3)),
                        ),
                        Switch(
                          onChanged: (value) {
                            save1(hard!);

                            setState(() {
                              hard = !hard!;
                            });
                          },
                          value: hard!,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  imgPath3 == 'null'
                      ? SizedBox()
                      : ListTile(
                          tileColor: const Color.fromARGB(46, 158, 158, 158),
                          splashColor: Colors.amber,

                          //      minLeadingWidth: 100,
                          title: Center(
                              child: const Text(
                            'falling object large ',
                            textAlign: TextAlign.center,
                            //    overflow: TextOverflow.visible,
                            style: const TextStyle(
                              fontFamily: 'Aclonica',
                            ),
                          )),
                          trailing: Switch(
                            onChanged: (value) {
                              save2(fallingObject!);

                              setState(() {
                                fallingObject = !fallingObject!;
                              });
                            },
                            value: fallingObject!,
                          ),
                          onTap: () async {
                            save2(fallingObject!);

                            setState(() {
                              fallingObject = !fallingObject!;
                            });
                          }),
                  SizedBox(
                    height: 5,
                  ),
                  imgPath4 == 'null'
                      ? SizedBox()
                      : ListTile(
                          tileColor: const Color.fromARGB(46, 158, 158, 158),
                          splashColor: Colors.amber,

                          //      minLeadingWidth: 100,
                          title: Center(
                              child: const Text(
                            'spark object large ',
                            textAlign: TextAlign.center,
                            //    overflow: TextOverflow.visible,
                            style: const TextStyle(
                              fontFamily: 'Aclonica',
                            ),
                          )),
                          trailing: Switch(
                            onChanged: (value) {
                              save3(sparkObject!);

                              setState(() {
                                sparkObject = !sparkObject!;
                              });
                            },
                            value: sparkObject!,
                          ),
                          onTap: () async {
                            save3(sparkObject!);

                            setState(() {
                              sparkObject = !sparkObject!;
                            });
                          }),
                  SizedBox(
                    height: 5,
                  ),
                  imgPath == 'null' && imgPath2 == 'null'
                      ? SizedBox()
                      : ListTile(
                          tileColor: const Color.fromARGB(46, 158, 158, 158),
                          splashColor: Colors.amber,

                          //      minLeadingWidth: 100,
                          title: Center(
                              child: const Text(
                            'Target small! ',
                            textAlign: TextAlign.center,
                            //    overflow: TextOverflow.visible,
                            style: const TextStyle(
                              fontFamily: 'Aclonica',
                            ),
                          )),
                          trailing: Switch(
                            onChanged: (value) {
                              save4(TargetSmall!);

                              setState(() {
                                TargetSmall = !TargetSmall!;
                              });
                            },
                            value: TargetSmall!,
                          ),
                          onTap: () async {
                            save4(TargetSmall!);

                            setState(() {
                              TargetSmall = !TargetSmall!;
                            });
                          })
                ],
              ),
            )));
  }
}
