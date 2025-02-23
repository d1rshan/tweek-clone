import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Darshan Paccha',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Gap(20),
              Text(
                'Account',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Gap(5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.tertiaryContainer,
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
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Gap(5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.tertiaryContainer,
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
                  color: Theme.of(context).colorScheme.tertiaryContainer,
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
                  color: Color.fromRGBO(154, 145, 168, 1),
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Text(
                trailing,
                style: TextStyle(
                  color: Color.fromRGBO(154, 145, 168, 1),
                ),
              ),
              Gap(15),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Color.fromRGBO(154, 145, 168, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
