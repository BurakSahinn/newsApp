import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/base_urls.dart';
import 'package:news_app/constants/general_datas.dart';
import 'package:news_app/models/news_model/news_article_model.dart';
import 'package:news_app/models/news_model/news_model.dart';
import 'package:news_app/screens/home_screen/service/home_services.dart';
import 'package:news_app/utilities/app_text_styles.dart';

class HomeController extends GetxController {
  HomeServices homeServices = HomeServices();

  RxInt tabIndex = 0.obs;

  TextEditingController seachFieldController = TextEditingController();

  late NewsModel? newsModel;
  RxBool newsLoadingStatue = false.obs;

  RxInt currentPage = 1.obs;

  List<NewsArticleModel> newsList = [];

  checkTextFieldEmpty() {
    if (seachFieldController.text == '') {
      errorDialog('Search bar is empty!');
    } else {
      getNewsListwithSearch();
    }
  }

  getNewsListwithSearch() async {
    try {
      changeLoadingStatue(newsLoadingStatue);

      newsModel = await homeServices.getNewsFromService(seachFieldController
                  .text ==
              ''
          ? "${BaseUrls.topNewsUrl}&page=$currentPage&pageSize=10"
          : "${BaseUrls.baseUrl}everything?q=${seachFieldController.text}&apiKey=${GeneralData.apiKey}&page=$currentPage&pageSize=10");

      newsList = newsModel!.articles!;
      currentPage.value++;
    } finally {
      changeLoadingStatue(newsLoadingStatue);
    }
  }

  changeLoadingStatue(RxBool loadingStatue) {
    loadingStatue.value = !loadingStatue.value;
  }

  errorDialog(String content) {
    return Get.defaultDialog(
        title: 'Warning',
        barrierDismissible: false,
        content: Text(
          content,
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "OK",
              style: AppTextStyles.boldTextStyle,
            ),
          )
        ]);
  }

  @override
  void onInit() {
    super.onInit();
    getNewsListwithSearch();
  }
}
