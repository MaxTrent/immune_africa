import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:immune_africa/themes/app_themes.dart';

import '../Widgets/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAppColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back), color: Colors.white,),
                Text('Notification', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.settings, size: 28,), color: Colors.white, )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child:
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r),topRight:Radius.circular(30.r)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.0.h, left: 40.w, bottom: 20.h),
                          child: Text('Today',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)
                          ),
                        ),
                        const NotificationTile(),
                        SizedBox(height: 20.h,),
                        const NotificationTile(),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0.h, left: 40.w, bottom: 20.h),
                          child: Text('This Week',
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        const NotificationTile(),
                        SizedBox(height: 20.h,),
                        const NotificationTile(),
                        SizedBox(height: 20.h,),
                        const NotificationTile(),
                        SizedBox(height: 20.h,),
                        const NotificationTile(),

                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppDivider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/notif.svg'),
              Text('It’s 2 more days to Chloe’s\nHep B Vaccine!', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black,fontSize: 18.sp),),
              Text('Tuesday', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black,fontSize: 18.sp),)
            ],
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}




