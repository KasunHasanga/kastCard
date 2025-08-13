import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/colors.dart';
import '../../../card/presentation/pages/card_page.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../controller/dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';
  final int selectedIndex;
  const DashboardPage({super.key, this.selectedIndex = 0});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int _selectedIndex;
  late DashboardController dashboardController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    dashboardController = Get.isRegistered<DashboardController>()
        ? Get.find()
        : Get.put(DashboardController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: [
              HomePage(),
              Container(),
              Container(),
              Container(),
              ProfilePage(),
            ],
          ),
        ],
      ),
      extendBody: true,
      floatingActionButton: GestureDetector(
          onTap: () {
            Get.toNamed(
              CardPage.routeName,
            );
            _onItemTapped(0);
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.kAppColor01,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: const Icon(Icons.credit_card),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        shadowColor: AppColors.kAppColor02,
        color: AppColors.kThemeBackgroundLight,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.apps,
                color: _selectedIndex == 0
                    ? AppColors.kAppColor01
                    : AppColors.kAppColor02,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.messenger,
                color: _selectedIndex == 1
                    ? AppColors.kAppColor01
                    : AppColors.kAppColor02,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: _selectedIndex == 3
                    ? AppColors.kAppColor01
                    : AppColors.kAppColor02,
              ),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle_rounded,
                color: _selectedIndex == 4
                    ? AppColors.kAppColor01
                    : AppColors.kAppColor02,
              ),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add any navigation logic here
    switch (index) {
      case 0:
        // Home
        break;
      case 1:
        // Explore
        break;
      case 2:
        // Add
        break;
      case 3:
        // Favorites
        break;
      case 4:
        // Profile
        break;
    }
  }
}
