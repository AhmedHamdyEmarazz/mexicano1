import 'package:amit/custompic.dart';
import 'package:amit/firsttheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawerr extends StatefulWidget {
  @override
  _AppDrawerrState createState() => _AppDrawerrState();
}

class _AppDrawerrState extends State<AppDrawerr> {
  @pragma('vm:entry-point')
  bool? hard;

  void get1() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hard = (prefs.getBool("hard") == null) || (prefs.getBool("hard") == false)
          ? false
          : true;
    });
    print(prefs.getBool("hard"));
  }

  void save1(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("hard", hard!);
    });
  }

  @override
  void initState() {
    super.initState();

    get1();
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
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 200,
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
                  )
                ],
              ),
            )));
  }
}