import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home_screen/controller/home_controller.dart';
import 'package:news_app/screens/home_screen/view/news_list_screen.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return DefaultTabController(
            initialIndex: homeController.tabIndex.value,
            length: 2,
            child: Scaffold(
              appBar: appBar(),
              bottomNavigationBar: bottomNavigationBar(),
              body: homeController.newsLoadingStatue.value == false
                  ? body()
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        },
      ),
    );
  }

  TabBarView body() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        NewsListScreen(),

        // SECOND PAGE
        GestureDetector(
          onTap: () {},
          child: const Text("test1"),
        ),
      ],
    );
  }

  TabBar bottomNavigationBar() {
    return TabBar(
      onTap: (value) {
        homeController.tabIndex.value = value;
      },
      tabs: const [
        Tab(icon: Icon(Icons.home)),
        Tab(icon: Icon(Icons.favorite)),
      ],
      labelColor: AppColors.blackColor,
      indicatorColor: AppColors.blackColor,
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        homeController.tabIndex.value == 0 ? "News App" : "Favorites",
        style: AppTextStyles.semiBoldTextStyle.copyWith(
          fontSize: 16.0.sp,
        ),
      ),
    );
  }
}
