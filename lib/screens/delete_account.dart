import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/screens/screens.dart';

import '../data/services.dart';
import '../data/storage.dart';
import '../main.dart';
import '../themes/app_themes.dart';

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

  Future<void> deleteAccount(BuildContext context, String password) async {
    try {
      state = DeleteAccountState(isLoading: true);
      await databaseService.deleteAccount(context, password);
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

class DeleteAccount extends ConsumerWidget {
  DeleteAccount({super.key});


  // static final _formKey = GlobalKey<FormState>();
  final _obscureTextProvider = StateProvider((ref) => true);
  final _passwordController = TextEditingController();
  static final _passwordKey = GlobalKey<FormFieldState>();

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
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your password',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 40.h,
            ),
            TextFormField(
              key: _passwordKey,
              enableInteractiveSelection: false,
              showCursor: true,
              cursorColor: primaryAppColor,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Password must be at least 6  character';
                }
              },
              keyboardType: TextInputType.name,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _passwordController,
              obscureText: ref.watch(_obscureTextProvider),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(_obscureTextProvider.notifier).state = !ref.read(_obscureTextProvider.notifier).state;
                    },
                    icon: ref.watch(_obscureTextProvider)
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: accentColor,
                          )),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryAppColor,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: accentColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: deleteAccountState.isLoading
                  ? const CircularProgressIndicator(
                color: primaryAppColor,
              )
                  : SizedBox(
                  height: 52.h,
                  width: 317.w,
                  child: AppButton(
                      onPressed: () async {
                        if (_passwordKey.currentState != null && _passwordKey.currentState!.validate()) {
                          ref
                              .read(deleteAccountNotifierProvider.notifier)
                              .deleteAccount(context,
                              _passwordController.text);
                        }
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
