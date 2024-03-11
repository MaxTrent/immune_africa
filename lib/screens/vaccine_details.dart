import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:intl/intl.dart';

class VaccineDetails extends ConsumerStatefulWidget {
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

  @override
  ConsumerState<VaccineDetails> createState() => _VaccineDetailsState();
}

class _VaccineDetailsState extends ConsumerState<VaccineDetails>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat("d MMMM yyyy", "en_US");
    DateFormat inputFormat = DateFormat("dd/MM/yyyy");
    DateTime date = inputFormat.parse(widget.dateOfBirth);
    DateTime newDate = date.add(const Duration(days: 6 * 7));
    String formattedNewDate = outputFormat.format(newDate);
    DateTime currentDate = DateTime.now();
    int totalDays = currentDate.difference(date).inDays;
    print(formattedNewDate);

    final List<Map<String, String>> vaccineList = [
      {'vaccine': 'Hepatitis B', 'date': formattedNewDate},
      {'vaccine': 'Oral Polio Vaccine', 'date': '14th July 2023'},
      {'vaccine': 'BCG', 'date': '14th July 2023'},
      {'vaccine': 'Pentavalent Vaccine', 'date': '14th July 2023'},
      {'vaccine': 'OPV Pnuemococcal Conjugate (PCV)', 'date': '14th July 2023'},
      {'vaccine': 'Rotavirus', 'date': '14th July 2023'},
    ];

    final List<Map<String, String>> vaccineStatusList = [
      {'vaccine': 'Hepatitis B', 'date': formattedNewDate, 'status': 'Received'},
      {
        'vaccine': 'Oral Polio Vaccine',
        'date': '14th July 2023',
        'status': 'Received'
      },
      {'vaccine': 'BCG', 'date': '14th July 2023', 'status': 'Not Received'},
      {
        'vaccine': 'Pentavalent Vaccine',
        'date': '14th July 2023',
        'status': 'Received'
      },
      {
        'vaccine': 'OPV Pnuemococcal Conjugate (PCV)',
        'date': '14th July 2023',
        'status': 'Received'
      },
      {
        'vaccine': 'Rotavirus',
        'date': '14th July 2023',
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
              Row(
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
                        backgroundImage: NetworkImage(widget.image),
                        radius: 30,
                      ),
                      Text(
                        widget.name,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.black, fontSize: 18.sp),
                      ),
                      Text(
                        widget.age,
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
              _buildTabBar(context),
              _buildTabBarContent(vaccineList, vaccineStatusList),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarContent(List vaccineList,List vaccineStatusList) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
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
                              color: vaccineStatusList[index]['status'] ==
                                      'Received'
                                  ? appGreen
                                  : appYellow,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              vaccineStatusList[index]['status'] ?? '',
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

  Widget _buildTabBar(BuildContext context) {
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
        controller: _tabController,
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
