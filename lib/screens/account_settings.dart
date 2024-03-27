import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/Widgets/app_button.dart';
import 'package:immune_africa/data/services.dart';
import 'package:immune_africa/screens/register_login.dart';
import 'package:immune_africa/themes/app_themes.dart';

import '../data/storage.dart';
import '../main.dart';



class DeleteAccountState {
  final bool isLoading;
  final String? error;

 DeleteAccountState({required this.isLoading, this.error});
}

class DeleteAccountNotifier extends StateNotifier<DeleteAccountState> {
  final DatabaseService databaseService;
  final VoidCallback onSuccess;

  DeleteAccountNotifier(this.databaseService, this.onSuccess)
      : super(DeleteAccountState(isLoading: false));

  Future<void> deleteAccount(BuildContext context) async {
    try {
      state = DeleteAccountState(isLoading: true);
      await databaseService.deleteAccount(context);
      state = DeleteAccountState(isLoading: false);
      onSuccess();
    } catch (error) {
      state = DeleteAccountState(isLoading: false, error: error.toString());
    }
  }
}

final deleteAccountNotifierProvider =
StateNotifierProvider<DeleteAccountNotifier, DeleteAccountState>((ref) {
  final databaseService = ref.read(databaseServiceProvider);
  final navigatorKey = ref.read(navigatorKeyProvider);
  return DeleteAccountNotifier(databaseService, () async {
    navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => const RegisterLogin()));
    await SharedPreferencesHelper.setLoggedOut();
  });
});



class AccountSettings extends ConsumerWidget {
  AccountSettings({super.key});

  static final valueProvider =
      StateProvider.family<bool, String>((ref, id) => true);

  @override
  Widget build(BuildContext context, ref) {
    final deleteAccountState = ref.watch(deleteAccountNotifierProvider);

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
              child: deleteAccountState.isLoading ? const CircularProgressIndicator(color: primaryAppColor,) : SizedBox(
                  height: 52.h,
                  width: 317.w,
                  child: AppButton(
                      onPressed: () async{
                        ref.read(deleteAccountNotifierProvider.notifier).deleteAccount(context);
                      },
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
