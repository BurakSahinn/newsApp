import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/news_source_screen/controller/news_source_controller.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsSourceScreen extends StatelessWidget {
  NewsSourceScreen({
    super.key,
    required this.newsUrl,
  });

  NewsSourceController newsSourceController = Get.put(NewsSourceController());

  final String newsUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.blackColor,
              size: 25.0.sp,
            ),
          ),
          centerTitle: true,
          title: Text(
            "News Source",
            style: AppTextStyles.boldTextStyle.copyWith(
              fontSize: 16.0.sp,
            ),
          ),
        ),
        body: WebView(
          initialUrl: newsSourceController.newsUrl,
        ),
      ),
    );
  }
}
