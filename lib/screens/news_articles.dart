import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('News Articles', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24, color: Colors.black),),
            const SizedBox(height: 10,),
              Container(height: 374,
              width: 333,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
                child: Image.asset('assets/cute-baby-born 1.png',fit: BoxFit.contain,),
              ),
              const SizedBox(height: 10,),
              Text(text, style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),

            ],
          ),
        ),
      ),
    );
  }
}
