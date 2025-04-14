import 'package:saporidiitalia/pages/detail/detail_binding.dart';
import 'package:saporidiitalia/pages/detail/detail_view.dart';
import 'package:saporidiitalia/pages/home/home_binding.dart';
import 'package:saporidiitalia/pages/home/home_view.dart';
import 'package:saporidiitalia/pages/login/login_binding.dart';
import 'package:saporidiitalia/pages/login/login_controller.dart';
import 'package:saporidiitalia/pages/login/login_view.dart';
import 'package:saporidiitalia/pages/root/root_binding.dart';
import 'package:saporidiitalia/pages/root/root_view.dart';
import 'package:saporidiitalia/pages/see_all/see_all_binding.dart';
import 'package:saporidiitalia/pages/see_all/see_all_view.dart';
import 'package:saporidiitalia/pages/profile/profile_binding.dart';
import 'package:saporidiitalia/pages/profile/profile_view.dart';
import 'package:saporidiitalia/pages/cart/cart_binding.dart';
import 'package:saporidiitalia/pages/cart/cart_view.dart';
import 'package:saporidiitalia/pages/checkout/checkout_binding.dart';
import 'package:saporidiitalia/pages/checkout/checkout_view.dart';
import 'package:saporidiitalia/routes/app_route_name.dart';
import 'package:get/get.dart';

class SignupMiddleware extends GetMiddleware {
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    Future.delayed(Duration.zero, () {
      final controller = Get.find<LoginController>();
      controller.switchToSignupTab();
    });
    return page;
  }
}

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
    GetPage(
      name: AppRouteName.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRouteName.cart,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRouteName.checkout,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: AppRouteName.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouteName.signup,
      page: () => LoginView(),
      binding: LoginBinding(),
      middlewares: [SignupMiddleware()],
    ),
  ];
}
