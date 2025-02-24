import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tweek_clone/components/my_navigation_button.dart';
import 'package:tweek_clone/settings_page.dart';
import 'package:tweek_clone/theme.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Feb 2025',
              style: titleLarge(color: white),
            ),
            MyNavigationButton(
              iconData: Icons.person,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return MyBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
        Gap(15),
        Divider(
          height: 0,
          color: grey,
          thickness: 2,
        ),
      ],
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
        color: lightPurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Darshan Paccha',
                style: titleMedium(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Settings',
                    style: bodyMedium(color: lightPurple),
                  ),
                ),
              ),
            ],
          ),
          Gap(20),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: purple,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: black,
                    ),
                    Gap(10),
                    Text(
                      'My Calendar',
                      style: titleSmall(),
                    ),
                  ],
                ),
                Icon(
                  Icons.check,
                  color: black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
