import 'package:amit/custompic.dart';
import 'package:amit/firsttheme.dart';
import 'package:flutter/material.dart';

class AppDrawerr extends StatefulWidget {
  @override
  _AppDrawerrState createState() => _AppDrawerrState();
}

class _AppDrawerrState extends State<AppDrawerr> {
  @pragma('vm:entry-point')
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
                                'customize target',
                                textAlign: TextAlign.center,
                                //    overflow: TextOverflow.visible,
                                style: const TextStyle(
                                  fontFamily: 'Aclonica',
                                ),
                              )),
                              onTap: () async {
                                Future.delayed(
                                    const Duration(milliseconds: 500), (() {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CustomPic();
                                  }));
                                }));
                              }))),
                  //  const Divider(),
                  SizedBox(
                    height: 20,
                  ),
//
                  Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              eight * 0.1, 3, eight * 0.1, 3),
                          child: ListTile(
                              tileColor:
                                  const Color.fromARGB(46, 158, 158, 158),
                              splashColor: Colors.amber,
                              leading: const Icon(Icons.home_filled),
                              //      minLeadingWidth: 100,
                              title: Center(
                                  child: const Text(
                                'Home page',
                                textAlign: TextAlign.center,
                                //    overflow: TextOverflow.visible,
                                style: const TextStyle(
                                  fontFamily: 'Aclonica',
                                ),
                              )),
                              onTap: () async {
                                Future.delayed(
                                    const Duration(milliseconds: 500), (() {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return FirstTheme();
                                  }));
                                }));
                              }))),
                ],
              ),
            )));
  }
}
