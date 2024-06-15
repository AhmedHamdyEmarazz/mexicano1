import 'package:amit/firsttheme.dart';
import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Wakelock.enable();
//   SharedPreferences sp = await SharedPreferences.getInstance();
//   String? email = sp.getString('email');
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(ChangeNotifierProvider.value(
//       value: GreatPlaces(),
//       child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: email == null ? SignUp() : TestScreen(email: email))));
// }
///////////////////////////////////////////////////////
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Wakelock.enable();
  // SharedPreferences sp = await SharedPreferences.getInstance();
  // String? email = sp.getString('email');
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: FirstTheme()));
}



///////////////////////////////////////////////////////
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//       value: GreatPlaces(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Great Places',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
//               .copyWith(secondary: Colors.amber),
//         ),
//         home: Counter(),
//         // routes: {
//         //   AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
//         //   PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
//         // }
//       ),
//     );
//   }
// }


/////////////////////////////////////////////////////////
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   bool bigger = true;
//   bool biggerr = true;

//   bool opa = false;
//   bool opaa = false;

//   bool move = false;
//   bool fly = false;
//   String bird = 'v';
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: // SingleChildScrollView(
//             //  child: Center(
//             //   child:
//             Column(
//           children: [
//             SizedBox(
//               height: 30,
//               child: AnimatedTextKit(
//                 animatedTexts: [
//                   ColorizeAnimatedText(
//                     '',
//                     textStyle: const TextStyle(fontSize: 14),
//                     colors: [
//                       Colors.white,
//                       Colors.white,
//                     ],
//                   ),
//                 ],
//                 //   pause: const Duration(seconds: 4),
//                 repeatForever: true,
//                 onNext: (p0, p1) {
//                   !move
//                       ? setState(() {
//                           opaa = false;
//                         })
//                       : null;
//                   fly
//                       ? setState(() {
//                           biggerr = !biggerr;
//                           bird = biggerr == false ? '٨' : 'v';
//                         })
//                       : null;
//                 },
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               height: 100,
//               child: Stack(children: [
//                 AnimatedOpacity(
//                     opacity: 0.0,
//                     duration: Duration(milliseconds: 60),
//                     child: AnimatedContainer(
//                         curve: Curves.easeInOutCirc,
//                         duration: Duration(milliseconds: 60),
//                         alignment: Alignment.topCenter,
//                         width: size.width, //bigger ? 200 : 100,
//                         height: bigger ? 180 : 100,
//                         decoration: BoxDecoration(
//                           color: !bigger
//                               ? Colors.white.withOpacity(opa ? 0.1 : 1.0)
//                               : Colors.white.withOpacity(opa ? 0.1 : 1.0),
//                           borderRadius: biggerr
//                               ? BorderRadius.all(Radius.circular(70.0))
//                               : BorderRadius.all(Radius.circular(0.0)),
//                         ))),
//                 Center(
//                   child: Container(
//                     color: Colors.blue.withOpacity(0.3),
//                     height: 5,
//                     width: size.width,
//                   ),
//                 ),
//                 AnimatedPositioned(
//                   onEnd: () {
//                     setState(() {
//                       opaa = true;
//                       fly = false;
//                     });
//                     // Future.delayed(const Duration(seconds: 3), () {
//                     //   setState(() {
//                     //     move = !move;
//                     //   });
//                     // });
//                   },
//                   left: !move ? 0 : size.width * 0.9,
//                   duration: move ? Duration(seconds: 4) : Duration(seconds: 0),
//                   child: AnimatedOpacity(
//                       onEnd: () {
//                         //   opaa = true;
//                       },
//                       opacity: opaa ? 0.3 : 1,
//                       duration: Duration(seconds: 1),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             move = !move;
//                             opa = false;
//                             opaa = false;
//                             fly = true;
//                             print('hello');
//                           });
//                           // Future.delayed(const Duration(seconds: 3), () {
//                           //   setState(() {
//                           //     opa = true;
//                           //   });
//                           // });
//                         },
//                         child: AnimatedContainer(
//                           alignment: !biggerr
//                               ? Alignment.topCenter
//                               : Alignment.bottomCenter,
//                           curve: Curves.easeInOutCirc,
//                           duration: Duration(milliseconds: 100),
//                           width: !biggerr ? 50 : 100,
//                           height: !biggerr ? 50 : 100,
//                           decoration: BoxDecoration(
//                             // color: !bigger
//                             //     ? Color.fromARGB(255, 255, 191, 1)
//                             //         .withOpacity(opa ? 0.1 : 1.0)
//                             //     : const Color.fromARGB(255, 255, 17, 0)
//                             //         .withOpacity(opa ? 0.1 : 1.0),
//                             borderRadius: biggerr
//                                 ? BorderRadius.all(Radius.circular(70.0))
//                                 : BorderRadius.all(Radius.circular(0.0)),
//                           ),
//                           child: Text(
//                             bird,
//                             style: TextStyle(
//                                 fontSize: size.width * 0.13,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       )),
//                 ),
//               ]),
//             ),

//             Stack(
//                 //    clipBehavior: Clip.hardEdge,
//                 //    fit: StackFit.passthrough,
//                 children: [
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     setState(() {
//                   //       move = !move;
//                   //       opa = false;

//                   //       print('hello');
//                   //     });
//                   //     // Future.delayed(const Duration(seconds: 3), () {
//                   //     //   setState(() {
//                   //     //     opa = true;
//                   //     //   });
//                   //     // });
//                   //   },
//                   //      child:

//                   //  ),
//                   AnimatedOpacity(
//                       opacity: 0.3,
//                       duration: Duration(milliseconds: 60),
//                       child: AnimatedContainer(
//                           curve: Curves.easeInOutCirc,
//                           duration: Duration(seconds: 1),
//                           width: size.width, //bigger ? 200 : 100,
//                           height: size.height * 0.6, //bigger ? 180 : 100,
//                           decoration: BoxDecoration(
//                             color: !bigger
//                                 ? Colors.white.withOpacity(opa ? 0.1 : 1.0)
//                                 : Colors.white.withOpacity(opa ? 0.1 : 1.0),
//                             borderRadius: bigger
//                                 ? BorderRadius.all(Radius.circular(70.0))
//                                 : BorderRadius.all(Radius.circular(0.0)),
//                           ))),

//                   Positioned(
//                       left: size.width * 0.77,
//                       top: size.height * 0.5,
//                       child: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             move = false;
//                             opa = false;
//                           });
//                         },
//                         icon: Container(
//                           width: size.width * 0.17,
//                           constraints:
//                               BoxConstraints(maxHeight: size.height * 0.34),
//                           padding: const EdgeInsets.all(2),
//                           margin: const EdgeInsets.only(left: 20, right: 20),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(5.0)),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(4.0),
//                             child: Image.asset(
//                               'assets/balaha1.jpeg',
//                               fit: BoxFit.fill,
//                               //  width: size.width * 0.3,
//                               //  height: size.height * 0.4,
//                             ),
//                           ),
//                         ),
//                       )),
//                   AnimatedPositioned(
//                     onEnd: () {
//                       setState(() {
//                         opa = true;
//                       });
//                       // Future.delayed(const Duration(seconds: 3), () {
//                       //   setState(() {
//                       //     move = !move;
//                       //   });
//                       // });
//                     },
//                     left: !move ? 0 : size.width * 0.83,
//                     top: !move ? 0 : size.height * 0.5,
//                     duration:
//                         move ? Duration(seconds: 4) : Duration(seconds: 0),
//                     child: AnimatedOpacity(
//                         opacity: opa ? 0.4 : 1,
//                         duration: Duration(milliseconds: 100),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               move = !move;
//                               opa = false;

//                               print('hello');
//                             });
//                             // Future.delayed(const Duration(seconds: 3), () {
//                             //   setState(() {
//                             //     opa = true;
//                             //   });
//                             // });
//                           },
//                           child: AnimatedContainer(
//                             alignment: Alignment.center,
//                             curve: Curves.easeInOutCirc,
//                             duration: Duration(seconds: 1),
//                             width: bigger ? 50 : 100,
//                             height: bigger ? 50 : 100,
//                             decoration: BoxDecoration(
//                               // color: !bigger
//                               //     ? Color.fromARGB(255, 255, 191, 1)
//                               //         .withOpacity(opa ? 0.1 : 1.0)
//                               //     : const Color.fromARGB(255, 255, 17, 0)
//                               //         .withOpacity(opa ? 0.1 : 1.0),
//                               borderRadius: bigger
//                                   ? BorderRadius.all(Radius.circular(70.0))
//                                   : BorderRadius.all(Radius.circular(0.0)),
//                             ),
//                             child: Text(
//                               !move ? '' : '💩',
//                               style: TextStyle(
//                                   fontSize: size.width * 0.08,
//                                   color: Colors.red),
//                             ),
//                           ),
//                         )),
//                   ),
//                 ]),

//             AnimatedOpacity(
//               opacity: !opaa ? 0.0 : 1,
//               duration: const Duration(seconds: 1),
//               child: Center(
//                   child: Text(
//                 'Game Over',
//                 style: TextStyle(
//                     fontSize: 60,
//                     fontStyle: FontStyle.italic,
//                     color: Colors.redAccent.withOpacity(!opaa ? 0.0 : 1)),
//               )),
//             )
//             // IconButton(
//             //     onPressed: () {
//             //       setState(() {
//             //         bigger = !bigger;
//             //         // red = !red;
//             //       });
//             //     },
//             //     icon: Icon(
//             //       Icons.change_circle,
//             //       size: 30,
//             //     )),
//             // // Load a Lottie file from your assets
//             // Container(
//             //     height: 180, child: Lottie.asset('assets/LottieLogo1.json')),

//             // // Load a Lottie file from a remote url
//             // Lottie.network(
//             //     'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

//             // // Load an animation and its images from a zip file
//             // //  Lottie.asset('assets/lottiefiles/angel.zip'),
//           ],
//         ),
//         //  ),
//         //    ),
//       ),
//     );
//   }
// }
