import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../themes/themes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Welcome, Jessica!', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none, size: 38, color: primaryAppColor,))
                      ],
                    ),
                    TextButton(onPressed: (){}, child: Text('Read More', style: Theme.of(context).textTheme.headline1!.copyWith(color: primaryAppColor),)),
                  ],
                ),
                 ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context, int){
                   return Container();
                 }),
                 Text('Nothing to show yet', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 19, color: Colors.black),),
                Container(
                  height: 98,
                  width: 98,
                  decoration: BoxDecoration(
                    color: primaryAppColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/syringe.svg', color: Colors.white,),
                      Text('ADD', style: Theme.of(context).textTheme.headline1,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
