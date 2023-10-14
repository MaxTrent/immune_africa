import 'package:flutter/material.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/themes/themes.dart';

class AddRecord extends StatelessWidget {
  const AddRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(

          children: [
            Form(
              child: Column(
                children: [
                  Text('NEW RECORD', style: Theme.of(context).textTheme.headline2!. copyWith(color: Colors.black),),
                  SizedBox(height: 20,),
                  Container(
                    height: 271,
                    width: 336,
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Text('First Name'),
                          TextFormField(),
                          TextFormField(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                      width: 317,
                      height: 52,
                      child: AppButton(onPressed: (){}, btnText: 'NEXT', btnBackgroundColor: primaryAppColor, btnTextColor: Colors.white))
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}
