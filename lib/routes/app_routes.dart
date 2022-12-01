import 'package:get/get.dart';
import 'package:news_app/constants/app_paths.dart';
import 'package:news_app/screens/detail_screen/view/detail_screen.dart';
import 'package:news_app/screens/home_screen/view/general_home_screen.dart';
import 'package:news_app/screens/news_source_screen/view/news_source_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: AppPaths.pathOfHomeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppPaths.pathOfDetailScreen,
      page: () => DetailScreen(
        newsId: Get.arguments,
      ),
    ),
    GetPage(
      name: AppPaths.pathOfNewsSourceScreen,
      page: () => NewsSourceScreen(
        newsUrl: Get.arguments,
      ),
    ),
  ];
}
