import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:table_calendar/table_calendar.dart';
import 'screens.dart';

class RecordDetails extends StatelessWidget {
  const RecordDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Chloe Adams',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              Center(
                  child: Text(
                '1 week old',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black),
              )),
              TableCalendar(
                daysOfWeekVisible: false,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Due',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VaccineDetails()));
                        });
                      },
                      child: Text(
                        'View all',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/syringe_red.svg',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'PCV II',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
              const Divider(
                height: 10,
                color: primaryAppColor,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Taken',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/syringe_green.svg',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Hepatitis  B',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
              const Divider(
                height: 10,
                color: primaryAppColor,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Upcoming',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/syringe_yellow.svg',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Hepatitis  B II',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
