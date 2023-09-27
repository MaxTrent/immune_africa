import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';

class CountryChoice extends StatelessWidget {
  const CountryChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'What country do you\ncurrently live in?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.black, fontSize: 24),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset('assets/map.png'),
              SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  height: 52,
                  width: 317,
                  child: CSCPicker(
                    showCities: false,
                    showStates: false,
                    onCountryChanged: (_){},
                    countrySearchPlaceholder: "Country",
                    countryDropdownLabel: "Thank Country",
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade300,
                        border:
                        Border.all(color: Colors.grey.shade300, width: 1)),
                    dropdownDecoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.grey.shade300, width: 4)),
                  ),
                ),
              ),
              //   TextFormField(
              //     decoration: const InputDecoration(
              //         labelText: 'Country',
              //         suffixIcon: Icon(Icons.keyboard_arrow_down)),
              //     onTap: () {
              //       showCountryPicker(
              //           context: context,
              //           onSelect: (Country country) {
              //             print('Select country: ${country.displayName}');
              //           },
              //           countryListTheme: CountryListThemeData(
              //             // Optional. Sets the border radius for the bottomsheet.
              //             borderRadius: const BorderRadius.only(
              //               topLeft: Radius.circular(40.0),
              //               topRight: Radius.circular(40.0),
              //             ),
              //             // Optional. Styles the search field.
              //             inputDecoration: InputDecoration(
              //               labelText: 'Search',
              //               hintText: 'Start typing to search',
              //               prefixIcon: const Icon(Icons.search),
              //               border: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                   color: const Color(0xFF8C98A8).withOpacity(0.2),
              //                 ),
              //               ),
              //             ),
              //           ));
              //     },
              //     readOnly: true,
              //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
