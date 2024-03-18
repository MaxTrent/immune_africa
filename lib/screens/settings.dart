import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider(),
      builder:(context, child)=> Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.w),
                      child: Text(
                        'Settings',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  AccountSettings()));
                        },
                        title: Text(
                          'Account Settings',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ),
                    const AppDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: (){Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  NotificationSettings()));},
                        title: Text(
                          'Notifications',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ),
                    const AppDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Language',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ),
                    const AppDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Help Center',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ),
                    const AppDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Privacy and Security',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ),
                    const AppDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'About Us',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ),
                    const AppDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Provide Feedback',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ),
                    const AppDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListTile(
                        onTap: (){
                          context.read<SettingsProvider>().signOut(context);
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Logout',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: primaryAppColor),
                        ),
                      ),
                    ),
                    const AppDivider(),
                  ],
                ),
              ),
            ),
          ),
          if (context.watch<SettingsProvider>().loading)
            const Center(
              child: CircularProgressIndicator(
                color: primaryAppColor,
              ),
            ),
        ],
      ),
    );
  }
}
