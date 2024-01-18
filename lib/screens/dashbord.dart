import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/data/services.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/add_record.dart';
import 'package:immune_africa/screens/screens.dart';
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
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: ChangeNotifierProvider<DashBoardProvider>(
        create: (_) => DashBoardProvider(),
        builder: (context, child) => Scaffold(
            body: SafeArea(
          child: RefreshIndicator(
            color: primaryAppColor,
            onRefresh: () =>
                Provider.of<DashBoardProvider>(context, listen: false)
                    .retrieveRecords(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAppBar(),
                    const _buildInfoTiles(),
                    const SizedBox(
                      height: 30,
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
                                      .headline1!
                                      .copyWith(
                                          fontSize: 19, color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
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
                                            builder: (context) => AddRecord()));
                                  },
                                  child: Container(
                                    height: 98,
                                    width: 98,
                                    decoration: BoxDecoration(
                                      color: primaryAppColor,
                                      borderRadius: BorderRadius.circular(50),
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
                                              .headline1,
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
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            .headline1!
                                            .copyWith(
                                                fontSize: 22,
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
                                          height: 63,
                                          width: 63,
                                          decoration: BoxDecoration(
                                            color: primaryAppColor,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/syringe.svg',
                                                width: 19,
                                                height: 20,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'ADD',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 400,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: context
                                              .watch<DashBoardProvider>()
                                              .retrievedRecordsList
                                              ?.length ??
                                          0 /*context.watch<DashBoardProvider>().retrievedRecordsList!.length*/,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                            String fullName =  '${context.watch<DashBoardProvider>().retrievedRecordsList![index].firstName} ${context.watch<DashBoardProvider>().retrievedRecordsList![index].lastName}';
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RecordDetails(
                                                            name: fullName)));
                                            },
                                            child: Container(
                                              width: 337,
                                              height: 171,
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    colors: [
                                                      Color(0xffE09FFF),
                                                      primaryAppColor
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                  // color: primaryAppColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const CircleAvatar(
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      'assets/cute-baby-born 1.png'),
                                                              radius: 40,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  // 'Chloe Adams',
                                                                  fullName,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline1,
                                                                ),
                                                                Text(
                                                                  '1 week old',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline1,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SvgPicture.asset(
                                                            'assets/calendar.svg'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20.0),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/checkmark.svg'),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Hepatitis B',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20.0),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/checkmark.svg'),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Oral polio vaccine',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline1,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
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
        )),
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
              'Welcome, ${_user!.displayName}!',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.black),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
                },
                icon: const Icon(
                  Icons.notifications_none,
                  size: 38,
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
                  .headline1!
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
      height: 190,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 184,
                width: 293,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/cute-baby-born 1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: primaryAppColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                    padding: const EdgeInsets.only(top: 110, left: 30),
                    child: Text(
                      'Ease the pain of\nvaccination',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
              ),
            );
          }),
    );
  }
}
