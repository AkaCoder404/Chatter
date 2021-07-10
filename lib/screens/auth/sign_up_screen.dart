import 'package:chat/screens/auth/sign_in_screen.dart';
import 'package:chat/screens/auth/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constants.dart';
import '../../components/primary_button.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.08),
                // SvgPicture.asset(
                //   MediaQuery.of(context).platformBrightness == Brightness.dark
                //       ? logoDarkTheme
                //       : logoLightTheme,
                // ),
                Image.asset(
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? "assets/images/logo2.png"
                      : "assets/images/logo2.png",
                  height: 146,
                ),
                SizedBox(height: constraints.maxHeight * 0.08),
                Text(
                  "注册",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: RequiredValidator(errorText: requiredField),
                        decoration: InputDecoration(
                            hintText: '名字',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none)),
                        onSaved: (name) {
                          // Save it
                        },
                      ),
                      SizedBox(height: defaultPadding),
                      TextFormField(
                        validator: RequiredValidator(errorText: requiredField),
                        decoration: InputDecoration(
                            hintText: '手机号',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none)),
                        keyboardType: TextInputType.phone,
                        onSaved: (phone) {
                          // Save it
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          validator: passwordValidator,
                          decoration: InputDecoration(
                              hintText: '密码',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none)),
                          obscureText: true,
                          onSaved: (passaword) {
                            // Save it
                          },
                        ),
                      ),
                      DropdownButtonFormField(
                        items: countries,
                        icon: Icon(Icons.expand_more),
                        onSaved: (country) {
                          // save it
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            hintText: '国籍',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: PrimaryButton(
                          text: '注册',
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerificationScreen(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: "已经有账号？ ",
                            children: [
                              TextSpan(
                                text: "登录",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// only for demo
List<DropdownMenuItem<String>>? countries = [
  "Bangladesh",
  "Switzerland",
  'Canada',
  'Japan',
  'Germany',
  'Australia',
  'Sweden',
].map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(value: value, child: Text(value));
}).toList();
