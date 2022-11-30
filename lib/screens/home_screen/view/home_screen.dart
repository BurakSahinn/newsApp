import 'package:flutter/material.dart';
import 'package:news_app/utilities/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.favorite)),
          ],
          labelColor: AppColors.blackColor,
          indicatorColor: AppColors.blackColor,
        ),
      ),
    );
  }
}
