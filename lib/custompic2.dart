import 'dart:convert';
import 'dart:io';

import 'package:amit/drawer.dart';
import 'package:amit/imageinput.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

class CustomPic2 extends StatefulWidget {
  const CustomPic2({super.key});

  @override
  State<CustomPic2> createState() => _CustomPic2State();
}

class _CustomPic2State extends State<CustomPic2> {
  String title = '';
  bool tex = false;
  // late VideoPlayerController controller;
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
    get1();
    get2();
    get3();
    get4();

    //  Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  String? imgPath;
  String? imgPath2;
  String? imgPath3;
  String? imgPath4;

  File? _pickedImage;
  File? _pickedImage2;
  File? _pickedImage3;
  File? _pickedImage4;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectImage2(File pickedImage) {
    _pickedImage2 = pickedImage;
  }

  void _selectImage3(File pickedImage) {
    _pickedImage3 = pickedImage;
  }

  void _selectImage4(File pickedImage) {
    _pickedImage4 = pickedImage;
  }

  static Future<bool> saveImage(List<int> imageBytes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String base64Image = base64Encode(imageBytes);
    return prefs.setString("image", base64Image);
  }

  static Future<Image> getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uint8List bytes = base64Decode(prefs.getString("image").toString());
    return Image.memory(bytes);
  }

  static Future<bool> saveImage2(List<int> imageBytes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String base64Image = base64Encode(imageBytes);
    return prefs.setString("image2", base64Image);
  }

  static Future<Image> getImage2() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uint8List bytes = base64Decode(prefs.getString("image2").toString());
    return Image.memory(bytes);
  }

  void save1(String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("image3", val);
    });
  }

  void save2(String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("image4", val);
    });
  }

  void save3(String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("image5", val);
    });
    print(prefs.getString("image5"));
  }

  void save4(String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("image6", val);
    });
    print(prefs.getString("image6"));
  }

  void get1() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath = prefs.getString("image3") == null
          ? 'null'
          : prefs.getString("image3");
    });
  }

  void get2() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath2 = prefs.getString("image4") == null
          ? 'null'
          : prefs.getString("image4");
    });
  }

  void get3() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath3 = prefs.getString("image5") == null
          ? 'null'
          : prefs.getString("image5");
    });
  }

  void get4() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath4 = prefs.getString("image6") == null
          ? 'null'
          : prefs.getString("image6");
    });
  }

  Future<List> picsx() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List pics = [];

    setState(() {
      prefs.getString("image3") != null
          ? pics.add(prefs.getString("image3"))
          : null;
      imgPath = prefs.getString("image3") == null
          ? 'null'
          : prefs.getString("image3");

      prefs.getString("image4") != null
          ? pics.add(prefs.getString("image4"))
          : null;
      imgPath2 = prefs.getString("image4") == null
          ? 'null'
          : prefs.getString("image4");
      prefs.getString("image5") != null
          ? pics.add(prefs.getString("image5"))
          : null;
      imgPath3 = prefs.getString("image5") == null
          ? 'null'
          : prefs.getString("image5");
      prefs.getString("image6") != null
          ? pics.add(prefs.getString("image6"))
          : null;
      imgPath4 = prefs.getString("image6") == null
          ? 'null'
          : prefs.getString("image6");
    });
    //  print(pics);
    return pics;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Wakelock.enable();
    final size = MediaQuery.of(context).size;
    title = 'Mexicano\'s roulette';

    return Scaffold(
      drawer: AppDrawerr(),
      appBar: AppBar(
          centerTitle: true,
          title: Container(
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
                  fontFamily: 'Aclonica',
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            ),
          ),
          backgroundColor: Colors.indigo.shade500,
          toolbarHeight: size.height * 0.1,
          //   leadingWidth: double.infinity,
          bottom: PreferredSize(
            preferredSize: size * 0.08,
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  //   size: size.height * 0.05,
                ),
              ),
              title: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.indigo.shade400,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(27, 0, 0, 0),
                            spreadRadius: 0.8,
                            offset: Offset(0, 4))
                      ]),
                  width: double.infinity,
                  height: size.height * 0.12,
                  child: // controller.value.isInitialized
                      //     ?
                      Container(
                    width: size.width * 0.17,
                    constraints: BoxConstraints(maxHeight: size.height * 0.24),
                    padding: const EdgeInsets.all(0),
                    //    margin: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0),
                      // borderRadius:
                      //     const BorderRadius.all(Radius.circular(7.0)),
                    ),
                    // child: GestureDetector(
                    //   onTap: () {
                    //     controller.play();
                    //   },
                    child: ClipOval(
                        child: Image.asset(
                      'assets/balahax.jpeg',
                      fit: BoxFit.contain,
                    ) // VideoPlayer(controller)
                        //  color: Color.fromARGB(255, 226, 219, 157),
                        //  ),
                        ),
                  )
                  // ClipRRect(
                  //                           borderRadius: BorderRadius.circular(20.0),
                  //                           child: VideoPlayer(controller)))
                  //    : Text('🫘')
                  ),
            ),
          )),
      body:
//  SingleChildScrollView(
//         child:
// SizedBox(
//           height: size.height ,
//           child:

          SingleChildScrollView(
              child: SizedBox(
                  height: size.height > 500
                      ? size.height * 1.5
                      : size.height > 400
                          ? size.height * 2.2
                          : size.height > 300
                              ? size.height * 3.0
                              : size.height * 4.5,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Divider(thickness: 2),
                              Text('Image 1 (falling object)'),
                              ImageInput(_selectImage),
                              //
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  _pickedImage != null
                                      ? AnimatedTextKit(
                                          onTap: () async {
                                            _pickedImage == null
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                    duration:
                                                        Duration(seconds: 2),
                                                    content: Text(
                                                      ' image1  not provided',
                                                    ),
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .errorColor,
                                                  ))
                                                : {
                                                    save1(_pickedImage!.path
                                                        .toString())
                                                  };
                                            setState(() {
                                              _pickedImage = null;
                                            });
                                          },
                                          animatedTexts: [
                                            ScaleAnimatedText(
                                              '💾',
                                              textAlign: TextAlign.center,
                                              scalingFactor: 2,
                                              textStyle: GoogleFonts.aclonica(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w200,
                                                  fontStyle: FontStyle.italic),
                                              duration:
                                                  Duration(milliseconds: 1500),
                                            ),
                                            ScaleAnimatedText(
                                              '💾',
                                              textAlign: TextAlign.center,
                                              scalingFactor: 0.5,
                                              textStyle: GoogleFonts.aclonica(
                                                  color: Colors.white,
                                                  fontSize: size.height < 300
                                                      ? 10
                                                      : 16,
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
                                        )
                                      : SizedBox(),
                                  IconButton(
                                    color: _pickedImage == null
                                        ? null
                                        : Colors.deepPurple,
                                    icon: Icon(Icons.save_alt_rounded),
                                    onPressed: () {
                                      _pickedImage == null
                                          ? ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                ' image1  not provided',
                                              ),
                                              backgroundColor:
                                                  Theme.of(context).errorColor,
                                            ))
                                          : {
                                              save1(
                                                  _pickedImage!.path.toString())
                                            };
                                      setState(() {
                                        _pickedImage = null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Divider(thickness: 2),
                              Text('Image 2 (spark object)'),
                              ImageInput(_selectImage2),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  _pickedImage2 != null
                                      ? AnimatedTextKit(
                                          onTap: () async {
                                            _pickedImage2 == null
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                    duration:
                                                        Duration(seconds: 2),
                                                    content: Text(
                                                      ' image2  not provided',
                                                    ),
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .errorColor,
                                                  ))
                                                : {
                                                    save2(_pickedImage2!.path
                                                        .toString())
                                                  };
                                            setState(() {
                                              _pickedImage2 = null;
                                            });
                                          },
                                          animatedTexts: [
                                            ScaleAnimatedText(
                                              '💾',
                                              textAlign: TextAlign.center,
                                              scalingFactor: 2,
                                              textStyle: GoogleFonts.aclonica(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w200,
                                                  fontStyle: FontStyle.italic),
                                              duration:
                                                  Duration(milliseconds: 1500),
                                            ),
                                            ScaleAnimatedText(
                                              '💾',
                                              textAlign: TextAlign.center,
                                              scalingFactor: 0.5,
                                              textStyle: GoogleFonts.aclonica(
                                                  color: Colors.white,
                                                  fontSize: size.height < 300
                                                      ? 10
                                                      : 16,
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
                                        )
                                      : SizedBox(),
                                  IconButton(
                                    color: _pickedImage2 == null
                                        ? null
                                        : Colors.deepPurple,
                                    // hoverColor: Colors.deepPurple.withOpacity(0.3),
                                    icon: Icon(Icons.save_alt_rounded),
                                    onPressed: () async {
                                      _pickedImage2 == null
                                          ? ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                ' image2  not provided',
                                              ),
                                              backgroundColor:
                                                  Theme.of(context).errorColor,
                                            ))
                                          : {
                                              save2(_pickedImage2!.path
                                                  .toString())
                                            };
                                      setState(() {
                                        _pickedImage2 = null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Divider(thickness: 2),
                              Text('Image 3 (falling object on collision)'),
                              ImageInput(_selectImage3),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  _pickedImage3 != null
                                      ? AnimatedTextKit(
                                          onTap: () async {
                                            _pickedImage3 == null
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                    duration:
                                                        Duration(seconds: 2),
                                                    content: Text(
                                                      ' image3  not provided',
                                                    ),
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .errorColor,
                                                  ))
                                                : {
                                                    save3(_pickedImage3!.path
                                                        .toString())
                                                  };
                                            setState(() {
                                              _pickedImage3 = null;
                                            });
                                          },
                                          animatedTexts: [
                                            ScaleAnimatedText(
                                              '💾',
                                              textAlign: TextAlign.center,
                                              scalingFactor: 2,
                                              textStyle: GoogleFonts.aclonica(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w200,
                                                  fontStyle: FontStyle.italic),
                                              duration:
                                                  Duration(milliseconds: 1500),
                                            ),
                                            ScaleAnimatedText(
                                              '💾',
                                              textAlign: TextAlign.center,
                                              scalingFactor: 0.5,
                                              textStyle: GoogleFonts.aclonica(
                                                  color: Colors.white,
                                                  fontSize: size.height < 300
                                                      ? 10
                                                      : 16,
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
                                        )
                                      : SizedBox(),
                                  IconButton(
                                    color: _pickedImage3 == null
                                        ? null
                                        : Colors.deepPurple,
                                    // hoverColor: Colors.deepPurple.withOpacity(0.3),
                                    icon: Icon(Icons.save_alt_rounded),
                                    onPressed: () async {
                                      _pickedImage3 == null
                                          ? ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                ' image3  not provided',
                                              ),
                                              backgroundColor:
                                                  Theme.of(context).errorColor,
                                            ))
                                          : {
                                              save3(_pickedImage3!.path
                                                  .toString())
                                            };
                                      setState(() {
                                        _pickedImage3 = null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Divider(thickness: 2),
                              Text('Image 4 (non collision falling object)'),
                              ImageInput(_selectImage4),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  _pickedImage4 != null
                                      ? AnimatedTextKit(
                                          onTap: () async {
                                            _pickedImage4 == null
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                    duration:
                                                        Duration(seconds: 2),
                                                    content: Text(
                                                      ' image4  not provided',
                                                    ),
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .errorColor,
                                                  ))
                                                : {
                                                    save4(_pickedImage4!.path
                                                        .toString())
                                                  };
                                            setState(() {
                                              _pickedImage4 = null;
                                            });
                                          },
                                          animatedTexts: [
                                            ScaleAnimatedText(
                                              '💾',
                                              textAlign: TextAlign.center,
                                              scalingFactor: 2,
                                              textStyle: GoogleFonts.aclonica(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w200,
                                                  fontStyle: FontStyle.italic),
                                              duration:
                                                  Duration(milliseconds: 1500),
                                            ),
                                            ScaleAnimatedText(
                                              '💾',
                                              textAlign: TextAlign.center,
                                              scalingFactor: 0.5,
                                              textStyle: GoogleFonts.aclonica(
                                                  color: Colors.white,
                                                  fontSize: size.height < 300
                                                      ? 10
                                                      : 16,
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
                                        )
                                      : SizedBox(),
                                  IconButton(
                                    color: _pickedImage4 == null
                                        ? null
                                        : Colors.deepPurple,
                                    // hoverColor: Colors.deepPurple.withOpacity(0.3),
                                    icon: Icon(Icons.save_alt_rounded),
                                    onPressed: () async {
                                      _pickedImage4 == null
                                          ? ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                ' image4  not provided',
                                              ),
                                              backgroundColor:
                                                  Theme.of(context).errorColor,
                                            ))
                                          : {
                                              save4(_pickedImage4!.path
                                                  .toString())
                                            };
                                      setState(() {
                                        _pickedImage4 = null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Divider(thickness: 2),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FutureBuilder<List>(
                              future: picsx(),
                              builder: (context, snapshot) {
                                if (ConnectionState.waiting == true) {
                                  return Text(
                                    'loading...',
                                    style: GoogleFonts.habibi(
                                        fontSize: 20,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  );
                                }

                                if (!snapshot.hasData) {
                                  return Center(
                                      child: Text(
                                    _pickedImage != null ||
                                            _pickedImage2 != null ||
                                            _pickedImage3 != null
                                        ? 'save the pic to approve'
                                        : 'no pics yet !! ...',
                                    style: GoogleFonts.habibi(
                                        fontSize: 20,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ));
                                }

                                return ConnectionState.waiting == true
                                    ? Text('loading...')
                                    : snapshot.data!.isEmpty
                                        ? Center(
                                            child: Text(
                                            _pickedImage != null ||
                                                    _pickedImage2 != null ||
                                                    _pickedImage3 != null
                                                ? 'save the pic to approve'
                                                : 'no pics yet !! ...',
                                            style: GoogleFonts.habibi(
                                                fontSize: 20,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic),
                                          ))
                                        :
                                        // greatPlaces.items.length <= 0
                                        //                 ? SizedBox()
                                        //                 :

                                        Container(
                                            alignment: Alignment.topCenter,
                                            height: size.height * 0.15,
                                            width: size.width * 0.7,
                                            child: ListView.builder(
                                              itemCount: // 2,
                                                  snapshot.data!.length
                                                      .clamp(0, 4),
                                              itemBuilder: (ctx, i) => ListTile(
                                                onTap: () {},
                                                onLongPress: () {},
                                                leading: CircleAvatar(
                                                  backgroundImage: FileImage(
                                                    File(snapshot.data![i]),
                                                  ),
                                                ),
                                                title: snapshot.data!.length ==
                                                        1
                                                    ? snapshot.data![i]
                                                                .toString() ==
                                                            imgPath
                                                        ? Text('image 1')
                                                        : snapshot.data![i]
                                                                    .toString() ==
                                                                imgPath2
                                                            ? Text('image 2')
                                                            : snapshot.data![i]
                                                                        .toString() ==
                                                                    imgPath3
                                                                ? Text(
                                                                    'image 3')
                                                                : snapshot.data![i]
                                                                            .toString() ==
                                                                        imgPath4
                                                                    ? Text(
                                                                        'image 4')
                                                                    : Text(
                                                                        'image x')
                                                    : Text('image ${i + 1}'),

                                                // Text('image ${i + 1}'),
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (ctx) =>
                                                          AlertDialog(
                                                        title: const Text(
                                                            'Are you sure?'),
                                                        content: const Text(
                                                          'Do you want to remove this pic?',
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: const Text(
                                                                'No'),
                                                            onPressed: () {
                                                              Navigator.of(ctx)
                                                                  .pop(false);
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: const Text(
                                                                'Yes'),
                                                            onPressed:
                                                                () async {
                                                              SharedPreferences
                                                                  storage =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              snapshot.data![i]
                                                                          .toString() ==
                                                                      imgPath
                                                                  ? storage.remove(
                                                                      'image3')
                                                                  : snapshot.data![i]
                                                                              .toString() ==
                                                                          imgPath2
                                                                      ? storage
                                                                          .remove(
                                                                              'image4')
                                                                      : snapshot.data![i].toString() ==
                                                                              imgPath3
                                                                          ? storage.remove(
                                                                              'image5')
                                                                          : storage
                                                                              .remove('image6');
                                                              Navigator.of(ctx)
                                                                  .pop(true);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                              }),
                        ),
                        // size.height > 300 && size.height < 500
                        // size.height > 500
                        //  ?
                        // Expanded(flex: 1, child:
                        // SizedBox(
                        //     width: size.width * 0.7,
                        //     child: Divider(thickness: 200))
                        // : SizedBox(),
                      ]))),

      // IconButton(
      //   color: Colors.green,
      //   icon: Icon(Icons.home_outlined),
      //   onPressed: () {
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) {
      //       return FirstTheme();
      //     }));
      //   },
      // ),
      //   ),

      // ),
      //   ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<GreatPlaces>(context, listen: false).delete();
      //   },
      //   child: ClipOval(child: Image.file(File(imgPath!))),
      // ),
    );
  }
}