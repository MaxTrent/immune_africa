import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/Widgets/widgets.dart';

import '../themes/themes.dart';

class NotificationSettings extends ConsumerWidget {
  NotificationSettings({super.key});

  static final valueProvider =
      StateProvider.family<bool, String>((ref, id) => true);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notification Settings',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Colors.black)),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'This is where you can control which notification this app sends you.',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 18.sp, color: Colors.black),
            ),
            const Divider(
              thickness: 1,
              color: primaryAppColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Immunization reminders',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              trailing: CupertinoSwitch(
                value: ref.watch(valueProvider('reminders')),
                onChanged: (value) {
                  ref.read(valueProvider('reminders').notifier).state = value;
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Turning off this notification means you will not receive any more immunization reminders for your infant.',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.black.withOpacity(0.8)),
            ),
            SizedBox(
              height: 30.h,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: CupertinoSwitch(
                value: ref.watch(valueProvider('updates')),
                onChanged: (value) {
                  ref.read(valueProvider('updates').notifier).state = value;
                },
              ),
              title: Text(
                'Immunize Platform\nUpdates',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Receive newsletters and notifications on our latest updates.',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.black.withOpacity(0.8)),
            ),

          ],
        ),
      ),
    );
  }
}
