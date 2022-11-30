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
          Container(
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
          ),
        ],
      ),
    );
  }
}
