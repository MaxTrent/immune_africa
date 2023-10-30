import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:immune_africa/screens/screens.dart';

import '../Widgets/widgets.dart';

class RegisterLogin extends StatelessWidget {
  const RegisterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SizedBox(
                // height: 1000,
                  width: 400,
                  child: SvgPicture.asset('assets/logo_background.svg')),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                color: const Color(0xffA564D3).withOpacity(0.85),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(),
                  SizedBox(height: 100,),
                  AppLogo(),
                  SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 54,
                        width: 317,
                        child: AppButton(btnBackgroundColor: Colors.white,
                            btnText: 'REGISTER',
                            btnTextColor: Theme
                                .of(context)
                                .primaryColor,
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) =>
                                      RegisterOption()
                                  ));
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 54,
                        width: 317,
                        child: AppButton(
                          btnBackgroundColor: Theme.of(context).primaryColor,
                          btnText: 'LOGIN',
                          btnTextColor: Colors.white,
                          onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignIn()));},),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),)
      ,
    );
  }
}