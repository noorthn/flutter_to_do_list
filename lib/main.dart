import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app/modules/home/controllers/home_binding.dart';
import 'app/modules/home/home_screen.dart';
import 'core/theme/theme.dart';
import 'routes/pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home                      : const HomeScreen(),
      initialBinding            : HomeBinding(),
      theme                     : lightTheme(context),
      getPages                  : AppPage.pages,
    );
  }
}