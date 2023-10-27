import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/themes/app_themes.dart';

class VaccineDetails extends StatefulWidget{
  const VaccineDetails({super.key});

  @override
  State<VaccineDetails> createState() => _VaccineDetailsState();
}

class _VaccineDetailsState extends State<VaccineDetails>  with SingleTickerProviderStateMixin{
  TabController? _tabController;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){Navigator.of(context).pop();},),
                    Text('Chloe Adams', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                    SvgPicture.asset('assets/profile2.svg'),
                  ],
                ),
                Text('1 week old', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add Vaccines',style: Theme.of(context).textTheme.headline1!.copyWith(color: const Color(0xff9F28F3), fontSize: 18),),
                  SvgPicture.asset('assets/syringe.svg', color: const Color(0xff9F28F3), height: 19, width: 20,),
                  ],
                ),
                TabBar(
                    controller: _tabController,
                    tabs: [
                  Tab(child: Text('Vaccines', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),),),
                  Tab(child: Text('Taken', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black)),),
                  Tab(child: Text('Not Yet Taken', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black)),),
                ]),
                TabBarView(
                    controller: _tabController,
                    children: [
                  ListView(
                    children: [
                      Text('Bruv'),
                      Text('Bruv'),
                      Text('Bruv'),
                    ],
                  ),
                      ListView(
                        children: [
                          Text('Bruv'),
                          Text('Bruv'),
                          Text('Bruv'),
                        ],
                      ),
                      ListView(
                        children: [
                          Text('Bruv'),
                          Text('Bruv'),
                          Text('Bruv'),
                        ],
                      ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
