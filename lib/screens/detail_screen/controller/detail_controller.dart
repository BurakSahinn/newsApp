import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home_screen/controller/home_controller.dart';

class DetailController extends GetxController {
  HomeController homeController = Get.find<HomeController>();

  int newsId = Get.arguments;

  Future<void> shareNews() async {
    await FlutterShare.share(
      title: homeController.newsModel!.articles![newsId].title!,
      linkUrl: homeController.newsModel!.articles![newsId].url,
    );
  }
}
