import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/screens/add_vaccines.dart';
import 'package:immune_africa/themes/app_themes.dart';

class VaccineDetails extends StatefulWidget {
  const VaccineDetails({super.key});

  @override
  State<VaccineDetails> createState() => _VaccineDetailsState();
}

class _VaccineDetailsState extends State<VaccineDetails>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
        child: SafeArea(
          child: Column(
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
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/baby2.png'),
                        radius: 30,
                      ),
                      Text(
                        'Chloe Adams',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        '1 week old',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/profile2.svg'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddVaccines()));
                      },
                      child: Text(
                        'Add Vaccines',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: const Color(0xff9F28F3), fontSize: 18),
                      )),
                  SvgPicture.asset(
                    'assets/syringe.svg',
                    color: const Color(0xff9F28F3),
                    height: 19,
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 378,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    border: Border.all(color: primaryAppColor)),
                child: TabBar(
                  controller: _tabController,
                  padding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      border: const Border.symmetric()),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color(0xff3E3E3E80),
                  tabs: const [
                    Tab(
                      text: 'Vaccines',
                    ),
                    Tab(
                      text: 'Taken',
                    ),
                    Tab(
                      text: 'Not Yet\nTaken',
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: primaryAppColor)),
                            leading:
                                SvgPicture.asset('assets/syringe_purple.svg'),
                            title: const Text('Hepatitis  B'),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: primaryAppColor,
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: primaryAppColor)),
                            leading:
                                SvgPicture.asset('assets/syringe_green.svg'),
                            title: const Text('Oral Polio Vaccine'),
                            subtitle: const Text('Date Received: 14th July 2023'),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: primaryAppColor)),
                            leading: SvgPicture.asset('assets/syringe_red.svg'),
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'PCV II',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 18, color: Colors.black),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Due Date: 11th July 2023',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 18, color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.zero,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Send Reminder',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: 18,
                                                color: primaryAppColor),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// return Scaffold(
//   key: _scaffoldKey,
//   body: SafeArea(
//     child: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){Navigator.of(context).pop();},),
//                 Text('Chloe Adams', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
//                 SvgPicture.asset('assets/profile2.svg'),
//               ],
//             ),
//             Text('1 week old', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Add Vaccines',style: Theme.of(context).textTheme.headline1!.copyWith(color: const Color(0xff9F28F3), fontSize: 18),),
//               SvgPicture.asset('assets/syringe.svg', color: const Color(0xff9F28F3), height: 19, width: 20,),
//               ],
//             ),
//             TabBar(
//                 controller: _tabController,
//                 tabs: [
//               Tab(child: Text('Vaccines', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),),),
//               Tab(child: Text('Taken', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black)),),
//               Tab(child: Text('Not Yet Taken', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black)),),
//             ]),
//             TabBarView(
//                 controller: _tabController,
//                 children: [
//               ListView(
//                 children: [
//                   Text('Bruv'),
//                 ],
//               ),
//                   ListView(
//                     children: [
//                       Text('Bruv'),
//                     ],
//                   ),
//                   ListView(
//                     children: [
//                       Text('Bruv'),
//                     ],
//                   ),
//             ])
//           ],
//         ),
//       ),
//     ),
//   ),
// );
