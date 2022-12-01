import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/base_urls.dart';
import 'package:news_app/constants/general_datas.dart';
import 'package:news_app/models/news_model/news_article_model.dart';
import 'package:news_app/models/news_model/news_model.dart';
import 'package:news_app/screens/home_screen/service/home_services.dart';
import 'package:news_app/utilities/app_text_styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  HomeServices homeServices = HomeServices();

  RxInt tabIndex = 0.obs;

  TextEditingController seachFieldController = TextEditingController();

  late NewsModel? newsModel;
  RxBool newsLoadingStatue = false.obs;

  RxInt currentPage = 1.obs;

  RxList<NewsArticleModel> newsList = <NewsArticleModel>[].obs;

  final Rx<RefreshController> refreshController =
      RefreshController(initialRefresh: true).obs;

  checkTextFieldEmpty() {
    if (seachFieldController.text == '') {
      errorDialog('Search bar is empty!');
    } else {
      newsList = <NewsArticleModel>[].obs;
      getNewsListwithSearch(isRefresh: true);
    }
  }

  getNewsListwithSearch({bool isRefresh = false}) async {
    try {
      changeLoadingStatue(newsLoadingStatue);

      if (isRefresh) {
        currentPage.value = 1;
      }

      newsModel = await homeServices.getNewsFromService(seachFieldController
                  .text ==
              ''
          ? "${BaseUrls.topNewsUrl}&page=$currentPage&pageSize=10"
          : "${BaseUrls.baseUrl}everything?q=${seachFieldController.text}&apiKey=${GeneralData.apiKey}&page=$currentPage&pageSize=10");

      if (newsModel!.status == "ok") {
        newsList.addAll(newsModel!.articles!);
        currentPage.value++;
        return true;
      } else {
        return false;
      }
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
}
