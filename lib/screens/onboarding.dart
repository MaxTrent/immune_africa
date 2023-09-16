import 'package:flutter/material.dart';
import 'package:immune_africa/screens/screens.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          children: [
            OnboardingPage(image: 'assets/baby1.png', scrollText: 'Safe', pageController: _controller, pageNumber: 1,),
            OnboardingPage(image: 'assets/baby2.png', scrollText: 'Strong', pageController: _controller, pageNumber: 2,),
            OnboardingPage(image: 'assets/baby3.png', scrollText: 'Healthy', pageController: _controller, pageNumber: 2,),

          ],

        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key,required this.image, required this.pageController, required this.scrollText, required this.pageNumber});
  String scrollText;
  String image;
  // VoidCallback? onPressed;
  int pageNumber;
  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 459,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(image,
            fit: BoxFit.cover,)),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Text('Keep Your Children',
              style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w200),),
              const SizedBox(height: 10,),
              SizedBox(
                width: 317,
                height: 52,
                child: ElevatedButton(onPressed: (){pageController.animateToPage(
                  pageNumber,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: Colors.white,
                      textStyle: Theme.of(context).textTheme.headline2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(scrollText,
                        style: Theme.of(context).textTheme.headline2!.copyWith( color: Theme.of(context).primaryColor),),
                        Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor,),
                      ],
                    ),
                ),
              ),
              SizedBox(height: 10,),
              TextButton(
                onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegisterLogin()));},
                child: Text('Skip', style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.normal),),
              )

            ]

          ),
        )
      ],
    );
  }
}
