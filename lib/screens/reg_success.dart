import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'screens.dart';

class RegisterSuccess extends StatefulWidget {
  RegisterSuccess({super.key, required this.callback});

  VoidCallback callback;

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 2,
        ),
      widget.callback);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
                // height: 1000,
                width: 400.w,
                child: SvgPicture.asset('assets/logo_background.svg')),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: const Color(0xffA564D3).withOpacity(0.85),
            ),
            child: Stack(
              children: [Padding(
                  padding: EdgeInsets.only(top: 50.0.h),
                  child: const AppLogo(),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/success_tick.svg'),
                     SizedBox(height: 20.h,),
                      Text(
                        'REGISTRATION\nSUCCESSFUL', textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
