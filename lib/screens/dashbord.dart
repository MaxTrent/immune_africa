import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/screens/add_record.dart';
import 'package:immune_africa/screens/screens.dart';
import '../themes/themes.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  bool isRecordAvailable = true;

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
                const _buildAppBar(),
                 const _buildInfoTiles(),
                 const SizedBox(height: 30,),
                 isRecordAvailable ? Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('MY RECORDS', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 22, color: Colors.black),),
                           GestureDetector(
                             onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddRecord()));},
                             child: Container(
                               height: 63,
                               width: 63,
                               decoration: BoxDecoration(
                                 color: primaryAppColor,
                                 borderRadius: BorderRadius.circular(50),
                               ),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SvgPicture.asset('assets/syringe.svg',width: 19, height: 20, color: Colors.white,),
                                   Text('ADD', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),),
                                 ],
                               ),
                             ),
                           ),


                         ],
                       ),
                       const SizedBox(height: 10,),
                       SizedBox(
                         height: 400,
                         child: ListView.builder(
                           scrollDirection: Axis.vertical,
                           itemCount: 5,
                           itemBuilder: (BuildContext context, int index){
                             return Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: GestureDetector(
                                 onTap: (){
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const RecordDetails()));
                                 },
                                 child: Container(
                                   width: 337,
                                   height: 171,
                                   decoration: BoxDecoration(
                                       gradient: const LinearGradient(
                                         colors: [Color(0xffE09FFF), primaryAppColor],
                                         begin: Alignment.centerLeft,
                                         end: Alignment.centerRight,
                                       ),
                                       // color: primaryAppColor,
                                       borderRadius: BorderRadius.circular(20)
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 const CircleAvatar(
                                                   backgroundImage: AssetImage('assets/cute-baby-born 1.png'),
                                                   radius: 40,
                                                 ),
                                                 Column(
                                                   children: [
                                                     Text('Chloe Adams', style: Theme.of(context).textTheme.headline1,),
                                                     Text('1 week old', style: Theme.of(context).textTheme.headline1,),
                                                   ],
                                                 ),

                                               ],
                                             ),
                                             SvgPicture.asset('assets/calendar.svg'),
                                           ],
                                         ),
                                         const SizedBox(height: 10,),
                                         Padding(
                                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                           child: Row(
                                             children: [
                                               SvgPicture.asset('assets/checkmark.svg'),
                                               const SizedBox(width: 10,),
                                               Text('Hepatitis B', style: Theme.of(context).textTheme.headline1,),
                                             ],
                                           ),
                                         ),
                                         const SizedBox(height: 10,),
                                         Padding(
                                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                           child: Row(
                                             children: [
                                               SvgPicture.asset('assets/checkmark.svg'),
                                               const SizedBox(width: 10,),
                                               Text('Oral polio vaccine', style: Theme.of(context).textTheme.headline1,),
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
                 ) : Column(
                   children: [
                     Text('Nothing to show yet', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 19, color: Colors.black),),
                     const SizedBox(height: 10,),
                     GestureDetector(
                       onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddRecord()));},
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _buildAppBar extends StatelessWidget {
  const _buildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Welcome, Jessica!', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),),
            IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NotificationScreen()));}, icon: const Icon(Icons.notifications_none, size: 38, color: primaryAppColor,))
          ],
        ),
        TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsArticles()));}, child: Text('Read More', style: Theme.of(context).textTheme.headline1!.copyWith(color: primaryAppColor),)),
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
    );
  }
}
