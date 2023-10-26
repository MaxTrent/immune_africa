import 'package:flutter/material.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/themes/themes.dart';
import 'package:dotted_border/dotted_border.dart';

class AddRecord extends StatelessWidget {

  AddRecord({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
          controller: _controller,
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100,),
                      Text('NEW RECORD', style: Theme
                          .of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 271,
                        width: 336,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)
                              )
                          ),
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                TextFormField(keyboardType: TextInputType.name,
                                  autovalidateMode: AutovalidateMode
                                      .onUserInteraction,
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    label: const Text('First Name'),
                                    labelStyle: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(color: Colors.black),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryAppColor,
                                      ),
                                    ),
                                  ),),
                                TextFormField(keyboardType: TextInputType.name,
                                  autovalidateMode: AutovalidateMode
                                      .onUserInteraction,
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    label: const Text('Last Name'),
                                    labelStyle: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(color: Colors.black),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryAppColor,
                                      ),
                                    ),
                                  ),),
                                TextFormField(keyboardType: TextInputType.name,
                                  autovalidateMode: AutovalidateMode
                                      .onUserInteraction,
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    label: const Text('Date of Birth'),
                                    labelStyle: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(color: Colors.black),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryAppColor,
                                      ),
                                    ),
                                  ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.male, size: 60,),
                                    VerticalDivider(
                                      width: 10,
                                      thickness: 5,
                                      color: Colors.black,
                                    ),
                                    Icon(Icons.female, size: 60,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 70,),
                      SizedBox(
                          width: 317,
                          height: 52,
                          child: AppButton(onPressed: () {
                            _controller.nextPage(duration: const Duration(
                                milliseconds: 500),
                              curve: Curves.ease,);
                          },
                              btnText: 'Next',
                              btnBackgroundColor: primaryAppColor,
                              btnTextColor: Colors.white))
                    ],
                  ),
                ),
              ),
            ),
            Form(
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100,),
                    Text('NEW RECORD', style: Theme
                        .of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black),),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 271,
                      width: 336,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)
                            )
                        ),
                        elevation: 15,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(keyboardType: TextInputType.name,
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction,
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  label: const Text('Relationship to child'),
                                  labelStyle: Theme
                                      .of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.black),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: primaryAppColor,
                                    ),
                                  ),
                                ),),
                              TextFormField(keyboardType: TextInputType.name,
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction,
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  label: const Text('Country of Birth'),
                                  labelStyle: Theme
                                      .of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.black),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: primaryAppColor,
                                    ),
                                  ),
                                ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70,),
                    SizedBox(
                        width: 317,
                        height: 52,
                        child: AppButton(onPressed: () {
                          _controller.nextPage(duration: const Duration(
                              milliseconds: 500),
                            curve: Curves.ease,);
                        },
                            btnText: 'Next',
                            btnBackgroundColor: primaryAppColor,
                            btnTextColor: Colors.white))
                  ],
                ),
              ),
            ),
            Form(
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Upload Photo', style: Theme
                              .of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: Colors.black),),
                          TextButton(onPressed: (){}, child: Text('Skip', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),))
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 271,
                      width: 336,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)
                            )
                        ),
                        elevation: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(70),
                          child: DottedBorder(
                            color: Colors.black,
                            radius: Radius.circular(20),
                            dashPattern: [5, 5],
                            strokeWidth: 2,
                            child: Center(
                              child: Container(
                                height: 120,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(Icons.add, size: 50, color: primaryAppColor,),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70,),
                    SizedBox(
                        width: 317,
                        height: 52,
                        child: AppButton(onPressed: () {
                          _controller.nextPage(duration: const Duration(
                              milliseconds: 500),
                            curve: Curves.ease,);
                        },
                            btnText: 'Done',
                            btnBackgroundColor: primaryAppColor,
                            btnTextColor: Colors.white))
                  ],
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
