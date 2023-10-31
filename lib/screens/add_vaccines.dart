import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Widgets/widgets.dart';
import '../themes/themes.dart';

class AddVaccines extends StatelessWidget {
  const AddVaccines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){Navigator.of(context).pop();},),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundImage: AssetImage('assets/baby2.png'), radius: 30,),
                      Text('Chloe Adams', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                      Text('1 week old', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 16),),

                    ],
                  ),
                  const SizedBox(width: 20,),
                ],
              ),
              const SizedBox(height: 10,),

              SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      child: Center(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30,),
                            SizedBox(
                              height: 423,
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
                                      TextFormField(keyboardType: TextInputType.name,
                                        autovalidateMode: AutovalidateMode
                                            .onUserInteraction,
                                        controller: TextEditingController(),
                                        decoration: InputDecoration(
                                          label: const Text('Sex'),
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
                                          label: const Text('Relationship'),
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
                            // SizedBox(
                            //     width: 317,
                            //     height: 52,
                            //     child: AppButton(onPressed: () {
                            //       _controller.nextPage(duration: const Duration(
                            //           milliseconds: 500),
                            //         curve: Curves.ease,);
                            //     },
                            //         btnText: 'Next',
                            //         btnBackgroundColor: primaryAppColor,
                            //         btnTextColor: Colors.white))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Form(
                      child: Center(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30,),
                            SizedBox(
                              height: 423,
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
                                      TextFormField(keyboardType: TextInputType.name,
                                        autovalidateMode: AutovalidateMode
                                            .onUserInteraction,
                                        controller: TextEditingController(),
                                        decoration: InputDecoration(
                                          label: const Text('Sex'),
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
                                          label: const Text('Relationship'),
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
                            // SizedBox(
                            //     width: 317,
                            //     height: 52,
                            //     child: AppButton(onPressed: () {
                            //       _controller.nextPage(duration: const Duration(
                            //           milliseconds: 500),
                            //         curve: Curves.ease,);
                            //     },
                            //         btnText: 'Next',
                            //         btnBackgroundColor: primaryAppColor,
                            //         btnTextColor: Colors.white))
                          ],
                        ),
                      ),
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
