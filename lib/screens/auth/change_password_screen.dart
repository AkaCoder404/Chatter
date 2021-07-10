import 'package:chat/components/primary_button.dart';
import 'package:chat/screens/auth/components/logo_with_title.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constants.dart';
import 'sign_in_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _password = '';
    return Scaffold(
      body: LogoWithTitle(
        title: "新密码",
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  obscureText: true,
                  validator: passwordValidator,
                  decoration: InputDecoration(
                    hintText: '密码',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none),
                  ),
                  onSaved: (passaword) {
                    // Save it
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    validator: (value) =>
                        MatchValidator(errorText: 'passwords do not match')
                            .validateMatch(value!, _password),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: ' 确认密码',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                    ),
                    onSaved: (passaword) {
                      // Save it
                    },
                  ),
                ),
              ],
            ),
          ),
          PrimaryButton(
            text: '新密码',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatsScreen(),
                  ),
                );
              }
            },
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
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
    );
  }
}
