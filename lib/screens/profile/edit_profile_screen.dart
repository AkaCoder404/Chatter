import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/search/components/body.dart';
import 'package:flutter/material.dart';

import 'components/profile_pic.dart';
import 'components/user_info_edit_field.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改信息"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            ProfilePic(
              image: demoContactsImage[0],
              imageUploadBtnPress: () {},
            ),
            Divider(),
            Form(
              child: Column(
                children: [
                  UserInfoEditField(
                    text: "名字",
                    child: TextFormFieldDesign(
                      initialValue: "AkaCoder",
                      isObscure: false,
                    ),
                  ),
                  UserInfoEditField(
                    text: "电子邮件",
                    child: TextFormFieldDesign(
                      initialValue: "akacoder@mail.com",
                      isObscure: false,
                    ),
                  ),
                  UserInfoEditField(
                    text: "手机号",
                    child: TextFormFieldDesign(
                      initialValue: "(111) 111-1111",
                      isObscure: false,
                    ),
                  ),
                  UserInfoEditField(
                    text: "定位",
                    child: TextFormFieldDesign(
                      initialValue: "New York, NVC",
                      isObscure: false,
                    ),
                  ),
                  UserInfoEditField(
                    text: "旧密码",
                    child: TextFormFieldDesign(
                      // obscureText: true,
                      initialValue: "demopass",
                      isObscure: true,
                      // decoration: InputDecoration(
                      //   suffixIcon: Icon(
                      //     Icons.visibility_off,
                      //     size: 20,
                      //   ),
                      // ),
                    ),
                  ),
                  UserInfoEditField(
                    text: "新密码",
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none),
                          hintText: "新密码"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  child: PrimaryButton(
                    padding: EdgeInsets.all(5),
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.08),
                    text: "取消",
                    press: () {},
                  ),
                ),
                SizedBox(width: defaultPadding),
                SizedBox(
                  width: 130,
                  child: PrimaryButton(
                    padding: EdgeInsets.all(5),
                    text: "保存",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget TextFormFieldDesign(
//     BuildContext context, String initialValue, bool isObscure) {
//   bool _isObscure = isObscure;
//   return TextFormField(
//     initialValue: initialValue,
//     obscureText: isObscure,
//     decoration: InputDecoration(
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           borderSide: BorderSide.none),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         borderSide: BorderSide.none,
//       ),
//       // icon: Icon(Icons.ac_unit),
//       suffixIcon: _isObscure
//           ? IconButton(
//               onPressed: () {
//                 _isObscure = !_isObscure;

//                 print(_isObscure);
//               },
//               icon: Icon(
//                 Icons.visibility_off,
//                 size: 20,
//               ),
//             )
//           : null,
//     ),
//   );
// }

class TextFormFieldDesign extends StatefulWidget {
  TextFormFieldDesign({
    this.initialValue,
    this.isObscure,
    Key? key,
  }) : super(key: key);

  String? initialValue = ""; // initial value
  bool? isObscure = true;

  @override
  TextFormFieldDesignState createState() => TextFormFieldDesignState(
      initialValue: initialValue, isObscure: isObscure);
}

class TextFormFieldDesignState extends State<TextFormFieldDesign> {
  TextFormFieldDesignState({Key? key, this.initialValue, this.isObscure});
  String? initialValue; // initial value
  bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: isObscure!,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        // icon: Icon(Icons.ac_unit),
        suffixIcon: isObscure!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure!;
                  });
                },
                icon: Icon(
                  Icons.visibility_off,
                  size: 20,
                ),
              )
            : null,
      ),
    );
  }
}
