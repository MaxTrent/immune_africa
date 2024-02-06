import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/providers/dashboard_provider.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'screens.dart';

class RecordDetails extends StatelessWidget {
  RecordDetails({Key? key, required this.name, required this.date, required this.image}):super(key:key);
  String name;
  String date;
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){Navigator.of(context).pop();},),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage(image,)),
                      Text(name, style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                      Text(date, style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 16),),

                      ],
                    ),
                    SizedBox(width: 20.w,),
                  ],
                ),
                TableCalendar(
                  daysOfWeekVisible: false,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Due',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black, fontSize: 18.sp),
                    ),
                    TextButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VaccineDetails(name: name, age: date, image: image,)));
                          });
                        },
                        child: Text(
                          'View all',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.grey, fontSize: 14.sp),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/syringe_red.svg',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'PCV II',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
                const Divider(
                  height: 10,
                  color: primaryAppColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Taken',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.black, fontSize: 18.sp),
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/syringe_green.svg',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Hepatitis  B',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
                const Divider(
                  height: 10,
                  color: primaryAppColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Upcoming',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.black, fontSize: 18.sp),
                ),SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/syringe_yellow.svg',
                    ),SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Hepatitis  B II',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
  }
}
