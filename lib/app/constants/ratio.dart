import 'package:flutter/cupertino.dart';

class Ratio {
  double widthApp = 0;
  double heightApp = 0;

  Ratio(BuildContext context) {
    widthApp = MediaQuery.of(context).size.width;
    heightApp = MediaQuery.of(context).size.height;
  }
}
