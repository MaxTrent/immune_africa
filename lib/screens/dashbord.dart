import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/screens/add_record.dart';
import '../themes/themes.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  bool isRecordAvailable = false;

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
                 SizedBox(
                   height: 190,
                   child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: 5,
                       itemBuilder: (BuildContext context, int index){
                     return Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                         height: 184,
                         width: 293,
                         decoration: BoxDecoration(
                           image: const DecorationImage(image: AssetImage('assets/cute-baby-born 1.png',),
                             fit: BoxFit.cover,
                           ),
                           color: primaryAppColor,
                           borderRadius: BorderRadius.circular(20)
                         ),
                         child: Padding(
                             padding: const EdgeInsets.only(top: 110, left: 30),
                             child: Text('Ease the pain of\nvaccination', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),)),
                       ),
                     );
                   }),
                 ),
                 const SizedBox(height: 80,),
                 isRecordAvailable ? Container() : Text('Nothing to show yet', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 19, color: Colors.black),),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddRecord()));},
                  child: Container(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
