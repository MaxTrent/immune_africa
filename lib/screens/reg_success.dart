import 'dart:async';
import 'package:flutter/material.dart';
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
                width: 400,
                child: SvgPicture.asset('assets/logo_background.svg')),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: const Color(0xffA564D3).withOpacity(0.85),
            ),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: AppLogo(),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/success_tick.svg'),
                      const SizedBox(height: 20,),
                      Text(
                        'REGISTRATION\nSUCCESSFUL', textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
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
