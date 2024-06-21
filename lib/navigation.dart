import 'package:amit/custompic.dart';
import 'package:amit/drawer.dart';
import 'package:amit/firsttheme.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

  String title = '';
  @override
  void initState() {
    _pages = [
      {
        'page': FirstTheme(), //
        'title': 'choose mode',
      },
      {
        'page': CustomPic(), //
        'title': 'customise target',
      },
    ];

    super.initState();
  }

  void _selectPage(int index) async {
    setState(() {
      _selectedPageIndex = index;
    });
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
            child: Container(
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
        ),
        body: _pages![_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            //   backgroundColor: Color.fromARGB(255, 226, 219, 157),
            elevation: 0,
            onTap: _selectPage,
            enableFeedback: true,
            backgroundColor: Color.fromARGB(255, 252, 250, 250),
            unselectedItemColor: Colors.grey.shade400,
            selectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(
              fontFamily: 'Aclonica',
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Aclonica',
            ),
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  color: _selectedPageIndex == 0
                      ? Colors.green
                      : Colors.green.withOpacity(0.3),
                ),
                label: 'choose mode',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.image,
                    color: _selectedPageIndex == 1
                        ? Colors.purple
                        : Colors.purple.withOpacity(0.3)),
                label: 'customize target',
              ),
            ]));
  }
}
