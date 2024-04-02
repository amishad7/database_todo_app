import 'package:flutter/cupertino.dart';

import '../../views/home/view/home.dart';

String home = "home";

Map<String, WidgetBuilder> pageRoutes = {
  home: (BuildContext context) => const HomePage(),
};
