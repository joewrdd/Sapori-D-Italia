//define all your page here
import 'package:saporidiitalia/pages/detail/detail_binding.dart';
import 'package:saporidiitalia/pages/detail/detail_view.dart';
import 'package:saporidiitalia/pages/home/home_binding.dart';
import 'package:saporidiitalia/pages/home/home_view.dart';
import 'package:saporidiitalia/pages/root/root_binding.dart';
import 'package:saporidiitalia/pages/root/root_view.dart';
import 'package:saporidiitalia/pages/see_all/see_all_binding.dart';
import 'package:saporidiitalia/pages/see_all/see_all_view.dart';
import 'package:saporidiitalia/routes/app_route_name.dart';
import 'package:get/get.dart';

class AppRoutePage {
  static final routes = [
    GetPage(
      name: AppRouteName.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouteName.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: AppRouteName.detail,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRouteName.seeAll,
      page: () => SeeAllView(),
      binding: SeeAllBinding(),
    ),
  ];
}
