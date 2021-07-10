import 'package:chat/components/recent_search_contacts.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/search/components/body.dart';
import 'package:flutter/material.dart';

import 'components/contact_card.dart';

class ContactSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通讯录"),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecentSearchContacts(),
                  SizedBox(height: defaultPadding),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "手机号 contacts",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .color!
                                .withOpacity(0.32),
                          ),
                    ),
                  ),
                  ...List.generate(
                    demoContactsImage.length,
                    (index) => ContactCard(
                      name: "Aka Coder",
                      number: "(111) 111-1111",
                      image: demoContactsImage[index],
                      isActive: index.isEven, // for demo
                      press: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
