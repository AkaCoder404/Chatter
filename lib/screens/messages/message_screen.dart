import 'package:chat/constants.dart';
import 'package:chat/screens/calling/audio_calling_screen.dart';
import 'package:chat/screens/calling/video_calling_screen.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // BackButton(),
          // ClipRRect(
          //   child: AssetImage("assets/images/OLP.png"),
          // ),
          Container(
            height: 30,
            width: 30,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: AssetImage("assets/images/OLP.png")),
                ),
              ),
            ),
          ),

          // CircleAvatar(
          //   backgroundImage: AssetImage("assets/images/OLP.png"),
          // ),
          SizedBox(width: defaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aka Coder",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AudioCallingScreen(),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoCallingScreen(),
            ),
          ),
        ),
        SizedBox(width: defaultPadding / 2),
      ],
    );
  }
}
