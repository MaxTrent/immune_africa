import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:immune_africa/data/notifcation_service.dart';
import 'package:immune_africa/data/storage.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:intl/intl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// final vaccineStatusProvider =
//     StateProvider.family<String, int>((ref, id) => 'Not Received');


final vaccineStatusProvider = StateProvider.family<String, _StatusProviderData>((ref, data) {
  String vaccineDate = data.vaccineDate;

  DateFormat outputFormat = DateFormat("d MMMM yyyy", "en_US");
  DateTime formatDate = outputFormat.parse(vaccineDate);

  // Check if the current date is after formatDate
  if (DateTime.now().isAfter(formatDate)) {
    return 'Due';
  } else {
    return 'Not Received';
  }
});

class _StatusProviderData {
  final int id;
  final String vaccineDate;

  _StatusProviderData(this.id, this.vaccineDate);
}

class VaccineDetails extends HookConsumerWidget {
  VaccineDetails(
      {required this.name,
      required this.age,
      required this.image,
      required this.dateOfBirth,
      super.key});

  String name;
  String age;
  String image;
  String dateOfBirth;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  @override
  Widget build(BuildContext context, ref) {
    final dateOfBirthProvider = StateProvider((ref) => dateOfBirth);

    final tabController = useTabController(initialLength: 2);
    DateFormat outputFormat = DateFormat("d MMMM yyyy", "en_US");
    DateFormat inputFormat = DateFormat("dd/MM/yyyy");
    DateTime date = inputFormat.parse(dateOfBirth);
    String dob = outputFormat.format(date);

    String getVaccinationDateWeeks(int weeks) {
      DateFormat outputFormat = DateFormat("d MMMM yyyy", "en_US");
      DateFormat inputFormat = DateFormat("dd/MM/yyyy");
      DateTime date = inputFormat.parse(dateOfBirth);
      DateTime newDate = date.add(Duration(days: weeks * 7));
      String vaccinationDate = outputFormat.format(newDate);
      DateTime currentDate = DateTime.now();
      int totalDays = currentDate.difference(date).inDays;

      return vaccinationDate;
    }

    String getVaccinationDateMonths(int months) {
      DateFormat outputFormat = DateFormat("d MMMM yyyy", "en_US");
      DateFormat inputFormat = DateFormat("dd/MM/yyyy");
      DateTime date = inputFormat.parse(dateOfBirth);
      DateTime newDate = DateTime(date.year, date.month + months, date.day);
      String vaccinationDate = outputFormat.format(newDate);
      DateTime currentDate = DateTime.now();
      int totalDays = currentDate.difference(date).inDays;
       return vaccinationDate;
    }

    final List<Map<String, String>> vaccineList = [
      {'vaccine': 'Hepatitis B', 'date': dob},
      {'vaccine': 'Oral Polio Vaccine', 'date': dob},
      {'vaccine': 'BCG', 'date': dob},
      {'vaccine': 'Pentavalent Vaccine', 'date': getVaccinationDateWeeks(6)},
      {
        'vaccine': 'OPV Pnuemococcal Conjugate (PCV)',
        'date': getVaccinationDateWeeks(6)
      },
      {'vaccine': 'Rotavirus', 'date': getVaccinationDateWeeks(6)},
      {'vaccine': 'Pentavalent Vaccine', 'date': getVaccinationDateWeeks(10)},
      {
        'vaccine': 'OPV Pnuemococcal Conjugate (PCV)',
        'date': getVaccinationDateWeeks(10)
      },
      {'vaccine': 'Rotavirus', 'date': getVaccinationDateWeeks(10)},
      {'vaccine': 'Pentavalent Vaccine', 'date': getVaccinationDateWeeks(14)},
      {
        'vaccine': 'OPV Pnuemococcal Conjugate (PCV)',
        'date': getVaccinationDateWeeks(14)
      },
      {
        'vaccine': 'Inactivated Polio Vaccine',
        'date': getVaccinationDateWeeks(14)
      },
      {
        'vaccine': 'Menigococcal Conjugate',
        'date': getVaccinationDateWeeks(18)
      },
      {'vaccine': 'Vitamin A', 'date': getVaccinationDateMonths(6)},
      {'vaccine': 'Measles', 'date': getVaccinationDateMonths(9)},
      {'vaccine': 'Yellow Fever', 'date': getVaccinationDateMonths(9)},
      {
        'vaccine': 'Measles Mumps and Rubella (MMR)',
        'date': getVaccinationDateMonths(12)
      },
      {'vaccine': 'Chicken Pox', 'date': getVaccinationDateMonths(12)},
      {'vaccine': 'Vitamin A', 'date': getVaccinationDateMonths(12)},
      {
        'vaccine': 'Menigococcal Conjugate',
        'date': getVaccinationDateMonths(12)
      },
      {
        'vaccine': 'Measles Mumps and Rubella (MMR)',
        'date': getVaccinationDateMonths(13)
      },
      {'vaccine': 'Chicken Pox', 'date': getVaccinationDateMonths(13)},
      {'vaccine': 'Hepatitis A', 'date': getVaccinationDateMonths(18)},
      {'vaccine': 'Hepatitis B', 'date': getVaccinationDateMonths(18)},
      {'vaccine': 'Vitamin A', 'date': getVaccinationDateMonths(18)},
      {'vaccine': 'Hepatitis A', 'date': getVaccinationDateMonths(19)},
      {'vaccine': 'Hepatitis B', 'date': getVaccinationDateMonths(19)},
      {'vaccine': 'Typhoid', 'date': getVaccinationDateMonths(24)},
      {'vaccine': 'Hepatitis A', 'date': getVaccinationDateMonths(24)},
      {'vaccine': 'Hepatitis B', 'date': getVaccinationDateMonths(24)},
    ];



    final List<Map<String, String>> vaccineStatusList = [
      {'vaccine': 'Hepatitis B', 'date': dob, 'status': 'Not Received'},
      {'vaccine': 'Oral Polio Vaccine', 'date': dob, 'status': 'Not Received'},
      {'vaccine': 'BCG', 'date': dob, 'status': 'Not Received'},
      {
        'vaccine': 'Pentavalent Vaccine',
        'date': getVaccinationDateWeeks(6),
        'status': 'Not Received'
      },
      {
        'vaccine': 'OPV Pnuemococcal Conjugate (PCV)',
        'date': getVaccinationDateWeeks(6),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Rotavirus',
        'date': getVaccinationDateWeeks(6),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Pentavalent Vaccine',
        'date': getVaccinationDateWeeks(10),
        'status': 'Not Received'
      },
      {
        'vaccine': 'OPV Pnuemococcal Conjugate (PCV)',
        'date': getVaccinationDateWeeks(10),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Rotavirus',
        'date': getVaccinationDateWeeks(10),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Pentavalent Vaccine',
        'date': getVaccinationDateWeeks(14),
        'status': 'Not Received'
      },
      {
        'vaccine': 'OPV Pnuemococcal Conjugate (PCV)',
        'date': getVaccinationDateWeeks(14),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Inactivated Polio Vaccine',
        'date': getVaccinationDateWeeks(14),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Menigococcal Conjugate',
        'date': getVaccinationDateWeeks(18),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Vitamin A',
        'date': getVaccinationDateMonths(6),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Measles',
        'date': getVaccinationDateMonths(9),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Yellow Fever',
        'date': getVaccinationDateMonths(9),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Measles Mumps and Rubella (MMR)',
        'date': getVaccinationDateMonths(12),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Chicken Pox',
        'date': getVaccinationDateMonths(12),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Vitamin A',
        'date': getVaccinationDateMonths(12),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Menigococcal Conjugate',
        'date': getVaccinationDateMonths(12),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Measles Mumps and Rubella (MMR)',
        'date': getVaccinationDateMonths(13),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Chicken Pox',
        'date': getVaccinationDateMonths(13),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Hepatitis A',
        'date': getVaccinationDateMonths(18),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Hepatitis B',
        'date': getVaccinationDateMonths(18),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Vitamin A',
        'date': getVaccinationDateMonths(18),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Hepatitis A',
        'date': getVaccinationDateMonths(19),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Hepatitis B',
        'date': getVaccinationDateMonths(19),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Typhoid',
        'date': getVaccinationDateMonths(24),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Hepatitis A',
        'date': getVaccinationDateMonths(24),
        'status': 'Not Received'
      },
      {
        'vaccine': 'Hepatitis B',
        'date': getVaccinationDateMonths(24),
        'status': 'Not Received'
      },
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.0.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildAppBar(context),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: Text(
                  'Vaccinations',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              _buildTabBar(context, tabController),
              _buildTabBarContent(
                  vaccineList, vaccineStatusList, tabController, ref),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 30,
              ),
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.black, fontSize: 18.sp),
              ),
              Text(
                age,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.black, fontSize: 16.sp),
              ),
            ],
          ),
          SvgPicture.asset('assets/profile2.svg'),
        ],
      ),
    );
  }

  Widget _buildTabBarContent(List vaccineList, List vaccineStatusList,
      TabController controller, WidgetRef ref) {


    return Expanded(
      child: TabBarView(
        controller: controller,
        children: [
          ListView.builder(
            itemCount: vaccineList.length,
            itemBuilder: (BuildContext context, int index) {

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 21.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            color: primaryAppColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            // offset: Offset(0, 0), // changes the shadow position
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/syringe_purple.svg',
                          height: 18.h,
                          width: 18.w,
                        ),
                        title: Text(
                          vaccineList[index]['vaccine'] ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        subtitle: Text(
                          vaccineList[index]['date'] ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 14.sp, color: Colors.black),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ListView.builder(
            itemCount: vaccineStatusList.length,
            itemBuilder: (BuildContext context, int index) {

              final data = _StatusProviderData(index, vaccineStatusList[index]['date']);


              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 21.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            color: primaryAppColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            // offset: Offset(0, 0), // changes the shadow position
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          final vaccineStatus = ref.watch(vaccineStatusProvider(data));
                          final vaccineStatusNotifier = ref.read(vaccineStatusProvider(data).notifier);
                          DateFormat outputFormat = DateFormat("d MMMM yyyy", "en_US");
                          DateTime formatDate = outputFormat.parse(vaccineStatusList[index]['date']);
                          String key = index.toString();

                          if (vaccineStatus == 'Received') {
                            print('Before: $vaccineStatus');
                            if (DateTime.now().isAfter(formatDate)) {
                              vaccineStatusNotifier.state = 'Due';
                            } else {
                              vaccineStatusNotifier.state = 'Not Received';
                            }

                            print('After: $vaccineStatus');
                            LocalNotificationService.cancel(index);
                            SharedPreferencesHelper.setNotReceived(key);
                          }else{
                            print('Before: $vaccineStatus');
                            vaccineStatusNotifier.state = 'Received';
                            print('After: $vaccineStatus');
                            ref.watch(localNotificationServiceProvider).showScheduleNotification(id: index, title: 'Vaccination Reminder', body: vaccineStatusList[index]['vaccine'], payload: '', date: vaccineStatusList[index]['date']);
                            SharedPreferencesHelper.setReceived(key);
                          }
                        },
                        leading: SvgPicture.asset(
                          'assets/syringe_purple.svg',
                          height: 18.h,
                          width: 18.w,
                        ),
                        title: Text(
                          vaccineStatusList[index]['vaccine'] ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 18.sp, color: Colors.black),
                        ),
                        subtitle: Text(
                          vaccineStatusList[index]['date'] ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 14.sp, color: Colors.black),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppStatusIndicator(
                              color: ref.watch(vaccineStatusProvider(data)) ==
                                      'Received'
                                  ? appGreen :ref.watch(vaccineStatusProvider(data)) ==
                                  'Due' ? appRed : appYellow,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              ref.watch(vaccineStatusProvider(data)),
                              // vaccineStatusList[index]['status'] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      fontSize: 14.sp, color: Colors.black),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context, TabController controller) {
    return Container(
      height: 50.h,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
              top: BorderSide(
                  color: primaryAppColor, width: 1, style: BorderStyle.solid),
              bottom: BorderSide(
                  color: primaryAppColor, width: 1, style: BorderStyle.solid))),
      child: TabBar(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        controller: controller,
        padding: EdgeInsets.zero,
        indicator: const BoxDecoration(color: Colors.transparent),
        labelStyle:
            Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 18.sp),
        labelColor: Colors.black,
        unselectedLabelColor: const Color(0xff3e3e3e).withOpacity(0.8),
        tabs: const [
          Tab(
            text: 'Vaccines',
          ),
          // VerticalDivider(
          //   color: primaryAppColor,
          // ),
          Tab(
            text: 'Status',
          ),
        ],
      ),
    );
  }
}

class AppStatusIndicator extends StatelessWidget {
  AppStatusIndicator({
    required this.color,
    super.key,
  });

  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      width: 16.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
