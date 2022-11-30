import 'package:get/get.dart';
import 'package:news_app/constants/app_paths.dart';
import 'package:news_app/screens/home_screen/view/general_home_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> getPages = [
    GetPage(name: AppPaths.pathOfHomeScreen, page: () => HomeScreen())
  ];
}
