import 'package:flutter/material.dart';
import 'package:immune_africa/themes/app_themes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAppColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back), color: Colors.white,),
                Text('Notification', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.settings, size: 28,), color: Colors.white, )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child:
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 40, bottom: 20),
                        child: Text('Today',
                          style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)
                        ),
                      ),
                      Divider(color: primaryAppColor, thickness: 1,)
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


