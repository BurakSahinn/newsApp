import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home_screen/controller/home_controller.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_radius.dart';
import 'package:sizer/sizer.dart';

class NewsListScreen extends StatelessWidget {
  NewsListScreen({super.key});

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      child: Column(
        children: [
          searchTextField(),
          SizedBox(height: 3.h),
          SizedBox(
              height: 66.h,
              width: Get.width,
              child: Obx(
                () {
                  return homeController.newsLoadingStatue.value == true
                      ? const CircularProgressIndicator()
                      : ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 2.h);
                          },
                          itemCount: homeController.newsModel!.articles!.length,
                          itemBuilder: (context, index) {
                            return newsCard(index);
                          },
                        );
                },
              ))
        ],
      ),
    );
  }

  Container newsCard(index) {
    return Container(
      height: 15.h,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor),
        borderRadius: AppRadius.containerRadius,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  homeController.newsModel!.articles![index].title!,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3.h),
                Text(
                  homeController.newsModel!.articles![index].description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          )
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
            onPressed: () {},
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
