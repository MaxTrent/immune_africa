import 'package:flutter/material.dart';

import '../themes/themes.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(color: primaryAppColor, thickness: 1,);
  }
}