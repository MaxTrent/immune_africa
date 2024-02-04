import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class NewsArticles extends StatelessWidget {
  NewsArticles({super.key});
  String text = loremIpsum(words: 60, paragraphs:1, initWithLorem: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('News Articles', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24.sp, color: Colors.black),),
            SizedBox(height: 10.h,),
              Container(height: 374.h,
              width: 333.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r)
              ),
                child: Image.asset('assets/cute-baby-born 1.png',fit: BoxFit.contain,),
              ),
              SizedBox(height: 10.h,),
              Text(text, style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18.sp),),

            ],
          ),
        ),
      ),
    );
  }
}
