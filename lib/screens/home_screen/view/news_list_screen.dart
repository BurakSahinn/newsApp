import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/app_paths.dart';
import 'package:news_app/screens/home_screen/controller/home_controller.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_radius.dart';
import 'package:news_app/utilities/app_text_styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

class NewsListScreen extends StatelessWidget {
  NewsListScreen({super.key});

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        child: Column(
          children: [
            searchTextField(),
            SizedBox(height: 3.h),
            newsList(),
          ],
        ),
      ),
    );
  }

  Obx newsList() {
    return Obx(
      () {
        return SizedBox(
          height: 66.h,
          width: Get.width,
          child: SmartRefresher(
            controller: homeController.refreshController.value,
            enablePullUp: true,
            onRefresh: () async {
              final result =
                  await homeController.getNewsListwithSearch(isRefresh: true);
              if (result) {
                homeController.refreshController.value.refreshCompleted();
              } else {
                homeController.refreshController.value.refreshFailed();
              }
            },
            onLoading: () async {
              final result = await homeController.getNewsListwithSearch();
              if (result) {
                homeController.refreshController.value.loadComplete();
              } else {
                homeController.refreshController.value.loadFailed();
              }
            },
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 2.h);
              },
              itemCount: homeController.newsList.length,
              itemBuilder: (context, index) {
                return newsCard(index);
              },
            ),
          ),
        );
      },
    );
  }

  GestureDetector newsCard(index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPaths.pathOfDetailScreen, arguments: index);
      },
      child: Container(
        height: 25.h,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: AppRadius.containerRadius,
        ),
        child: Row(
          children: [
            newsInfos(index),
            SizedBox(width: 5.w),
            newsImage(index),
          ],
        ),
      ),
    );
  }

  SizedBox newsImage(index) {
    return SizedBox(
      height: 18.h,
      width: 30.w,
      child: Image.network(
        homeController.newsList[index].urlToImage!,
      ),
    );
  }

  Expanded newsInfos(index) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            homeController.newsList[index].title!,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.boldTextStyle,
          ),
          SizedBox(height: 3.h),
          Text(
            homeController.newsList[index].description!,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          SizedBox(height: 2.h),
          Text(
            homeController.newsList[index].source!.name!,
          ),
          SizedBox(height: 1.h),
          Text(
            DateFormat('dd/MM/yyyy').format(
              homeController.newsList[index].publishedAt!,
            ),
          ),
        ],
      ),
    );
  }

  Container searchTextField() {
    return Container(
      height: 8.h,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyColor,
        ),
        borderRadius: AppRadius.textFieldRadius,
      ),
      child: TextField(
        controller: homeController.seachFieldController,
        decoration: InputDecoration(
          hintText: "Type a Text",
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {
              homeController.checkTextFieldEmpty();
            },
            icon: Icon(
              Icons.search,
              size: 20.sp,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
