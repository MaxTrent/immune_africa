import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/screens/screens.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('REGISTER', style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 29.sp),),
                  SizedBox(
                    height: 35.h,
                  ),
                  SizedBox(
                    height: 54.h,
                    width: 317.w,
                    child: AppButton(btnBackgroundColor: Colors.white, btnText: 'As a parent', btnTextColor: Theme.of(context).primaryColor, onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> IndividualSignUp()));},),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 54.h,
                    width: 317.w,
                    child: AppButton(btnBackgroundColor: Colors.white, btnText: 'Hospital', btnTextColor: Theme.of(context).primaryColor, onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HospitalSignUp()));},),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );;
  }
}


