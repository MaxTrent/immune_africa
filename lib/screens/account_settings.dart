import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/Widgets/app_button.dart';
import 'package:immune_africa/themes/app_themes.dart';

class AccountSettings extends ConsumerWidget {
  AccountSettings({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account Settings',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Colors.black)),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'This is where you can control your\nlogin settings',
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
                'Require password to\nlog in',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              trailing: CupertinoSwitch(
                value: ref.watch(valueProvider('password')),
                onChanged: (value) {
                  ref.read(valueProvider('password').notifier).state = value;
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Turning on this setting will require you to enter your ImmuneAfrica password each time you open the app.',
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
                value: ref.watch(valueProvider('biometric')),
                onChanged: (value) {
                  ref.read(valueProvider('biometric').notifier).state = value;
                },
              ),
              title: Text(
                'Enable Touch ID or\nFace ID to unlock App',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: SizedBox(
                  height: 52.h,
                  width: 317.w,
                  child: AppButton(
                      onPressed: () {},
                      btnText: 'Delete Account',
                      btnBackgroundColor: const Color(0xffF90733),
                      btnTextColor: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
