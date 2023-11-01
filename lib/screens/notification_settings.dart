import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account Settings', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black)),
            const SizedBox(height: 10,),
            Text('This is where you can control your login settings', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18, color: Colors.black),),
            const Divider(thickness: 1, color: primaryAppColor,),
            SizedBox(height: 20,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Require password to\nlog in', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),),
              trailing: CupertinoSwitch(value: true, onChanged: (value) {  },),
            ),
            SizedBox(height: 10,),
            Text('Turning on this setting will require you to enter your ImmuneAfrica password each time you open the app.', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black.withOpacity(0.8)),),
            SizedBox(height: 30,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: CupertinoSwitch(value: false, onChanged: (value){},),
              title: Text('Enable Touch ID or\nFace ID to unlock App', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
            )
          ],
        ),
      ),
    );
  }
}
