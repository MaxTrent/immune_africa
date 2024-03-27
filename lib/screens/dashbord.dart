import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/data/services.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../themes/themes.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final services = DatabaseService();
  Future<List<Records>>? _records;
  List<Records>? _retrievedRecords;
  bool isRecordAvailable = false;
  DatabaseService service = DatabaseService();
  final _auth = FirebaseAuth.instance;
  User? _user;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DashBoardProvider()),
          ChangeNotifierProvider(create: (_) => AddRecordProvider()),
        ],
        builder: (context, child) => Scaffold(
            body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            child: RefreshIndicator(
              color: primaryAppColor,
              onRefresh: () =>
                  Provider.of<DashBoardProvider>(context, listen: false)
                      .retrieveRecords(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildAppBar(),
                      const _buildInfoTiles(),
                      SizedBox(
                        height: 30.h,
                      ),
                      FutureBuilder(
                          future: Provider.of<DashBoardProvider>(context,
                                  listen: false)
                              .retrieveRecords(),
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator(
                                color: primaryAppColor,
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                'An Error Occurred\n${snapshot.error}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        fontSize: 19.sp, color: Colors.black),
                              );
                            }
                            // else if (provider.retrievedRecordsList != null && provider.retrievedRecordsList!.isNotEmpty) {
                            //   // context.read<DashBoardProvider>().retrieveRecordsDetails();
                            //
                            //
                            // }
                            else if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                context
                                        .watch<DashBoardProvider>()
                                        .retrievedRecordsList
                                        ?.isEmpty ==
                                    true) {
                              return Column(
                                children: [
                                  Text(
                                    'Nothing to show yet',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            fontSize: 19.sp,
                                            color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (kDebugMode) {
                                        print(context
                                            .read<DashBoardProvider>()
                                            .retrievedRecordsList);
                                      }
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddRecord()));
                                    },
                                    child: Container(
                                      height: 98.h,
                                      width: 98.h,
                                      decoration: BoxDecoration(
                                        color: primaryAppColor,
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/syringe.svg',
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'ADD',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.0.w),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'MY RECORDS',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                  fontSize: 22.sp,
                                                  color: Colors.black),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (kDebugMode) {
                                              print(context
                                                  .read<DashBoardProvider>()
                                                  .retrievedRecordsList);
                                            }
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddRecord()));
                                          },
                                          child: Container(
                                            height: 63.h,
                                            width: 63.w,
                                            decoration: BoxDecoration(
                                              color: primaryAppColor,
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/syringe.svg',
                                                  width: 19.w,
                                                  height: 20.h,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'ADD',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall!
                                                      .copyWith(
                                                          fontSize: 14.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      height: 400.h,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: context
                                                .watch<DashBoardProvider>()
                                                .retrievedRecordsList
                                                ?.length ??
                                            0 /*context.watch<DashBoardProvider>().retrievedRecordsList!.length*/,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          int daysDif;
                                          int totalWeeks = 0;
                                          String duration;
                                          String dob = context
                                              .watch<DashBoardProvider>()
                                              .retrievedRecordsList![index]
                                              .dob;
                                          DateFormat format =
                                              DateFormat("dd/MM/yyyy");
                                          DateTime date = format.parse(dob);
                                          DateTime currentDate = DateTime.now();
                                          int totalDays = currentDate
                                              .difference(date)
                                              .inDays;
                                          String imageUrl = context
                                              .watch<DashBoardProvider>()
                                              .retrievedRecordsList![index]
                                              .imgUrl;
                                          String fullName =
                                              '${context.watch<DashBoardProvider>().retrievedRecordsList![index].firstName} ${context.watch<DashBoardProvider>().retrievedRecordsList![index].lastName}';

                                          if (totalDays < 7 && totalDays > 1) {
                                            daysDif = totalDays;
                                            duration = '$daysDif days';
                                          } else if (totalDays <= 1) {
                                            daysDif = totalDays;
                                            duration = '$daysDif day';
                                          } else {
                                            totalWeeks = (totalDays / 7).ceil();
                                            if (totalWeeks == 1) {
                                              duration = '$totalWeeks week';
                                            } else {
                                              duration = '$totalWeeks weeks';
                                            }
                                          }
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VaccineDetails(
                                                            name: fullName,
                                                            age:
                                                                '$duration old',
                                                            image: imageUrl,
                                                            dateOfBirth: dob,
                                                          )));
                                            },
                                            child: _buildRecord(context,
                                                index, fullName, duration),
                                          );
                                        },
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildRecord(
      BuildContext context, int index, String fullName, String duration) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 18.h),
      child: Container(
        width: 337.w,
        // height: 171.h,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xffE09FFF), primaryAppColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(context
                              .watch<DashBoardProvider>()
                              .retrievedRecordsList![index]
                              .imgUrl),
                          radius: 40.r,
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              fullName,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Text(
                              '$duration old',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset('assets/calendar.svg'),
                  ],
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset('assets/checkmark.svg'),
                //       SizedBox(
                //         width: 10.w,
                //       ),
                //       Text(
                //         'Hepatitis B',
                //         style: Theme.of(context).textTheme.displaySmall,
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset('assets/checkmark.svg'),
                //       SizedBox(
                //         width: 10.w,
                //       ),
                //       Text(
                //         'Oral polio vaccine',
                //         style: Theme.of(context).textTheme.displaySmall,
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _buildAppBar extends StatelessWidget {
  _buildAppBar({
    Key? key,
  }) : super(key: key);

  final _auth = FirebaseAuth.instance;
  User? _user;

  @override
  Widget build(BuildContext context) {
    _user = _auth.currentUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome, ${_user!.displayName!.split(' ').first}!',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.black),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
                },
                icon: Icon(
                  Icons.notifications_none,
                  size: 38.h,
                  color: primaryAppColor,
                ))
          ],
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewsArticles()));
            },
            child: Text(
              'Read More',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: primaryAppColor),
            )),
      ],
    );
  }
}

class _buildInfoTiles extends StatelessWidget {
  const _buildInfoTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(10.0.h),
              child: Container(
                height: 184.h,
                width: 293.w,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/cute-baby-born 1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: primaryAppColor,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                    padding: EdgeInsets.only(top: 110.h, left: 30.w),
                    child: Text(
                      'Ease the pain of\nvaccination',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
              ),
            );
          }),
    );
  }
}
