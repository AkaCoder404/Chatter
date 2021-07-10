import 'package:chat/components/primary_button.dart';
import 'package:chat/screens/auth/change_password_screen.dart';
import 'package:chat/screens/auth/components/logo_with_title.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constants.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoWithTitle(
        title: '忘记密码',
        subText: "输入账号手机号，更新密码",
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: RequiredValidator(errorText: requiredField),
                decoration: InputDecoration(
                    hintText: '手机号',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none)),
                keyboardType: TextInputType.phone,
                onSaved: (phone) {
                  // Save it
                },
              ),
            ),
          ),
          PrimaryButton(
            text: '下一个',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
