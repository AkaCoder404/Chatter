import 'package:animations/animations.dart';
import 'package:chat/screens/calls/calls_hsitory_screen.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:chat/screens/contacts/contacts_screen.dart';
import 'package:chat/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    ChatsScreen(),
    ContactsScreen(),
    CallsHistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      // body: PageTransitionSwitcher(
      //   transitionBuilder: (
      //     Widget child,
      //     Animation<double> animation,
      //     Animation<double> secondaryAnimation,
      //   ) {
      //     return FadeThroughTransition(
      //       animation: animation,
      //       secondaryAnimation: secondaryAnimation,
      //       child: child,
      //     );
      //   },
      //   child: pageList[pageIndex],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "聊天"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "通讯录"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "通话"),
          BottomNavigationBarItem(
            icon: Container(
              height: 23,
              width: 23,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: new Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: new DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: AssetImage("assets/images/OLP.png"),
                    ),
                  ),
                ),
              ),
            ),
            // icon: CircleAvatar(
            //   radius: 14,

            //   backgroundImage: AssetImage("assets/images/OLP.png"),
            // ),
            label: "我",
          ),
        ],
      ),
    );
  }
}
