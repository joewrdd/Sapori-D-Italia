import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saporidiitalia/utils/color.dart';
import 'package:saporidiitalia/widgets/tabbar_item.dart';
import 'package:saporidiitalia/pages/home/home_view.dart';
import 'package:saporidiitalia/pages/profile/profile_view.dart';
import 'package:saporidiitalia/pages/profile/profile_controller.dart';
import 'package:saporidiitalia/pages/root/root_controller.dart';
import 'package:saporidiitalia/routes/app_route_name.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure controllers are initialized
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }

    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(),
        bottomNavigationBar: _buildFooter(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: secodPrimary,
          child: SvgPicture.asset(
            "assets/icons/cart.svg",
            width: 25,
            height: 25,
            color: primary,
          ),
          onPressed: () {
            Get.toNamed(AppRouteName.cart);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBody() {
    final profileController = Get.isRegistered<ProfileController>()
        ? Get.find<ProfileController>()
        : Get.put(ProfileController());

    return IndexedStack(
      index: controller.tabIndex.value,
      children: [
        HomeView(),
        GetBuilder<ProfileController>(
          init: profileController,
          builder: (_) => ProfileView(),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return AnimatedBottomNavigationBar.builder(
      backgroundGradient: gradientFullPrimary,
      onTap: (index) {
        controller.tabIndex.value = index;
      },
      itemCount: controller.tabs.length,
      backgroundColor: background,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      tabBuilder: (int index, bool isActive) {
        return TabBarItem(isActive: isActive, icon: controller.tabs[index]);
      },
      activeIndex: controller.tabIndex.value,
    );
  }
}
