import 'package:flutter/material.dart';

import 'package:chat/screens/search/components/body.dart';

import '../../constants.dart';
import 'components/call_history_card.dart';

class CallsSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通话记录"),
      ),
      body: Column(
        children: [
          // Appbar search
          Container(
            margin: EdgeInsets.only(bottom: defaultPadding),
            padding: EdgeInsets.fromLTRB(
              defaultPadding,
              0,
              defaultPadding,
              defaultPadding,
            ),
            color: primaryColor,
            child: Form(
              child: TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  // search
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      // borderSide: BorderSide(color: Colors.blue)),
                      borderSide: BorderSide.none),
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: contentColorLightTheme.withOpacity(0.64),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: contentColorLightTheme.withOpacity(0.64),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: ListView(
                children: [
                  // For demo
                  ...List.generate(
                    demoContactsImage.length,
                    (index) => CallHistoryCard(
                      name: "Aka Coder",
                      image: demoContactsImage[index],
                      time: "3m ago",
                      isActive: index.isEven,
                      isOutgoingCall: index.isOdd,
                      isVideoCall: index.isEven,
                      press: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
