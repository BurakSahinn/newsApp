import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/app_paths.dart';
import 'package:news_app/routes/app_routes.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'News App',
          getPages: AppRoutes.getPages,
          initialRoute: AppPaths.pathOfHomeScreen,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
