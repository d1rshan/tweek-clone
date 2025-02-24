import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tweek_clone/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Darshan Paccha',
                style: titleLarge(),
              ),
              Gap(20),
              Text(
                'Account',
                style: titleSmall(),
              ),
              Gap(5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: purple,
                ),
                child: Column(
                  children: [
                    MySettingsTile(leading: 'Name', trailing: 'Darshan Paccha'),
                    MySettingsTile(
                        leading: 'Email', trailing: 'darshan.paccha@gmail.com'),
                    MySettingsTile(
                        leading: 'Password', trailing: '', isLastItem: true),
                  ],
                ),
              ),
              Gap(20),
              Text(
                'App Preferences',
                style: titleSmall(),
              ),
              Gap(5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: purple,
                ),
                child: Column(
                  children: [
                    MySettingsTile(leading: 'Appearance', trailing: 'Dark'),
                    MySettingsTile(leading: 'Vibration', trailing: 'On'),
                    MySettingsTile(leading: 'Date format', trailing: 'DD-MM'),
                    MySettingsTile(
                      leading: 'Week start on',
                      trailing: 'Monday',
                      isLastItem: true,
                    ),
                  ],
                ),
              ),
              Gap(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: purple,
                ),
                child: Column(
                  children: [
                    MySettingsTile(leading: 'About', trailing: ''),
                    MySettingsTile(leading: 'Privacy Policy', trailing: ''),
                    MySettingsTile(leading: 'Log out', trailing: ''),
                    MySettingsTile(
                      leading: 'Delete account',
                      trailing: '',
                      isLastItem: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySettingsTile extends StatelessWidget {
  final String leading;
  final String trailing;
  final bool isLastItem;
  const MySettingsTile({
    super.key,
    required this.leading,
    required this.trailing,
    this.isLastItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: !isLastItem
            ? BorderDirectional(
                bottom: BorderSide(
                  color: darkerPurple,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: bodyMedium(),
          ),
          Row(
            children: [
              Text(
                trailing,
                style: bodyMedium(color: darkerPurple),
              ),
              Gap(15),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: darkerPurple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
