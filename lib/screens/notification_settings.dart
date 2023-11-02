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
            Text('Notification Settings', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black)),
            const SizedBox(height: 10,),
            Text('This is where you can control which notification this app sends you.', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18, color: Colors.black),),
            const Divider(thickness: 1, color: primaryAppColor,),
            SizedBox(height: 20,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Immunization reminders', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),),
              trailing: CupertinoSwitch(value: true, onChanged: (value) {  },),
            ),
            SizedBox(height: 10,),
            Text('Turning off this notification means you will not receive any more immunization reminders for your infant.', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black.withOpacity(0.8)),),
            SizedBox(height: 30,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: CupertinoSwitch(value: false, onChanged: (value){},),
              title: Text('Immunize Platform\nUpdates', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 10,),
            Text('Receive newsletters and notifications on our latest updates.', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black.withOpacity(0.8)),),
          ],
        ),
      ),
    );
  }
}
