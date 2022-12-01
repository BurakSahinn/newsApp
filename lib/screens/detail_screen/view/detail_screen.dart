import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/app_paths.dart';
import 'package:news_app/screens/detail_screen/controller/detail_controller.dart';
import 'package:news_app/screens/home_screen/controller/home_controller.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
    required this.newsId,
  });

  final int newsId;

  DetailController detailController = Get.put(DetailController());
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar(),
          body: SingleChildScrollView(
            child: Obx(
              () {
                return homeController.newsLoadingStatue.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 4.w),
                        child: Wrap(
                          runSpacing: 3.h,
                          children: [
                            newsImage(),
                            newsTitle(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                newsSource(),
                                newsDate(),
                              ],
                            ),
                            newsDescription(),
                            goToNewsSourceButton(),
                          ],
                        ),
                      );
              },
            ),
          )),
    );
  }

  Container goToNewsSourceButton() {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(
            AppPaths.pathOfNewsSourceScreen,
            arguments: homeController.newsModel!.articles![newsId].url,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          side: BorderSide(
            color: AppColors.greyColor,
          ),
        ),
        child: Text(
          "News Source",
          style: AppTextStyles.semiBoldTextStyle,
        ),
      ),
    );
  }

  Text newsDescription() {
    return Text(
      homeController.newsModel!.articles![newsId].description!,
    );
  }

  Row newsDate() {
    return Row(
      children: [
        Icon(
          Icons.date_range_outlined,
          color: AppColors.blackColor,
        ),
        SizedBox(width: 2.w),
        Text(
          DateFormat('dd/MM/yyyy').format(
            homeController.newsModel!.articles![newsId].publishedAt!,
          ),
        ),
      ],
    );
  }

  Row newsSource() {
    return Row(
      children: [
        Icon(
          Icons.apartment,
          color: AppColors.blackColor,
        ),
        SizedBox(width: 2.w),
        Text(
          homeController.newsModel!.articles![newsId].source!.name!,
        ),
      ],
    );
  }

  Text newsTitle() {
    return Text(
      homeController.newsModel!.articles![newsId].title!,
      style: AppTextStyles.semiBoldTextStyle,
    );
  }

  SizedBox newsImage() {
    return SizedBox(
      height: 35.h,
      width: Get.width,
      child: Image.network(
        homeController.newsModel!.articles![newsId].urlToImage!,
        fit: BoxFit.fill,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
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
      actions: [
        IconButton(
          onPressed: () {
            detailController.shareNews();
          },
          icon: Icon(
            Icons.share,
            color: AppColors.blackColor,
            size: 20.0.sp,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: AppColors.blackColor,
            size: 20.0.sp,
          ),
        )
      ],
    );
  }
}
