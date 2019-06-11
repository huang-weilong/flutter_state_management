import 'package:flutter/material.dart';

import 'home_page.dart';
import 'second_page.dart';

class AppRoute {
  static final Map<String, WidgetBuilder> routes = {
    '/second': (_) => SecondPage(),
  };
}
