import 'package:flutter/material.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:immune_africa/themes/app_themes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Text(
                  'Settings',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AccountSettings()));
                  },
                  title: Text(
                    'Account Settings',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              AppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationSettings()));},
                  title: Text(
                    'Notifications',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              AppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Language',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              AppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Help Center',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              AppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Privacy and Security',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              AppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'About Us',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              AppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Provide Feedback',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              AppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Logout',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18, color: primaryAppColor),
                  ),
                ),
              ),
              AppDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
