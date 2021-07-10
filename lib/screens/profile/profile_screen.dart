import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

import 'components/info.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            ProfilePic(image: "assets/images/OLP.png"),
            Text(
              "Aka Coder",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(height: defaultPadding * 2),
            Info(
              infoKey: "用户名",
              info: "@akacoder.me",
            ),
            Info(
              infoKey: "定位",
              info: "New York, NYC",
            ),
            Info(
              infoKey: "手机号",
              info: "(111) 111-1111",
            ),
            Info(
              infoKey: "邮件",
              info: "akacoder404@mail.com",
            ),
            SizedBox(height: defaultPadding),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120,
                child: PrimaryButton(
                  padding: EdgeInsets.all(5),
                  text: "修改信息",
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
