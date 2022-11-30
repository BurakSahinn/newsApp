import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/base_urls.dart';
import 'package:news_app/models/news_model/news_model.dart';
import 'package:news_app/screens/home_screen/service/home_services.dart';

class HomeController extends GetxController {
  HomeServices homeServices = HomeServices();

  RxInt tabIndex = 0.obs;

  TextEditingController seachFieldController = TextEditingController();

  late NewsModel? newsModel;
  RxBool newsLoadingStatue = false.obs;

  getNewsList() async {
    try {
      changeLoadingStatue();
      newsModel = await homeServices.getNewsFromService(BaseUrls.topNewsUrl);
    } finally {
      changeLoadingStatue();
    }
  }

  changeLoadingStatue() {
    newsLoadingStatue.value = !newsLoadingStatue.value;
  }

  @override
  void onInit() {
    super.onInit();
    getNewsList();
  }
}
