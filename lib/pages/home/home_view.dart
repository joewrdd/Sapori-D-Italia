import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saporidiitalia/utils/color.dart';
import 'package:saporidiitalia/widgets/category_tab.dart';
import 'package:saporidiitalia/widgets/product_item.dart';
import 'package:saporidiitalia/utils/constant.dart';
import 'package:saporidiitalia/data/product_data.dart';
import 'package:saporidiitalia/pages/home/home_controller.dart';
import 'package:saporidiitalia/routes/app_route_name.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_getHeader(), _getSearch(), _getCategories(), _getMenu()],
      ),
    );
  }

  Widget _getHeader() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
            left: spaceBetweenItems,
            right: spaceBetweenItems,
            top: spaceBetweenItems),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back, Joe",
                  style: GoogleFonts.italiana(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Sapori Di Italia.",
                  style: GoogleFonts.italiana(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: primary.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Choose From A Wide Range Of Italian Dishes.",
                  style: GoogleFonts.italiana(
                    fontWeight: FontWeight.w600,
                    color: black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(spaceBetweenItems),
              child: Container(
                width: 50,
                height: 50,
                child: Image.asset(
                    "assets/images/F6BAF086-9F94-4A0F-A571-ADB7D625BB09_1_201_a.heic"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getSearch() {
    return Container(
      padding: EdgeInsets.only(
          left: spaceBetweenItems,
          right: spaceBetweenItems,
          top: spaceBetweenItems),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 6,
                      offset: Offset(0, 3),
                      color: black.withOpacity(0.03),
                    ),
                  ],
                ),
                child: TextFormField(
                  onTapOutside: (event) =>
                      FocusScope.of(Get.context!).unfocus(),
                  cursorColor: primary,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: GoogleFonts.italiana(
                      color: primary.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                    ),
                    filled: true,
                    fillColor: white,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      width: 28,
                      height: 28,
                      child: SvgPicture.asset(
                        "assets/icons/search.svg",
                        color: black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(spaceBetweenItems),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(spaceBetweenItems),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(spaceBetweenItems),
                color: secodPrimary,
              ),
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: 28,
                height: 28,
                child: SvgPicture.asset("assets/icons/filter.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCategories() {
    return Container(
      padding: EdgeInsets.only(top: spaceBetweenItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: spaceBetweenItems, right: spaceBetweenItems),
            child: Text(
              "Categories",
              style: GoogleFonts.italiana(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: spaceBetweenItems),
          CategoryTab(),
        ],
      ),
    );
  }

  Widget _getMenu() {
    return Container(
      padding: EdgeInsets.only(top: spaceBetweenItems),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: spaceBetweenItems, right: spaceBetweenItems),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Menu",
                  style: GoogleFonts.italiana(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouteName.seeAll);
                  },
                  child: Text(
                    "See All",
                    style: GoogleFonts.italiana(
                      color: black.withOpacity(0.5),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: spaceBetweenItems),
          Container(
            padding: EdgeInsets.only(
                left: spaceBetweenItems, right: spaceBetweenItems),
            child: Obx(() {
              String categoryType =
                  controller.getCategoryType(controller.selectedCategory.value);
              List filteredProducts = PRODUCTS
                  .where((product) =>
                      product["image"].toString().startsWith(categoryType))
                  .toList();

              return Column(
                children: List.generate(
                  filteredProducts.length,
                  (index) {
                    var product = filteredProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRouteName.detail,
                          arguments: {"data": product},
                        );
                      },
                      child: ProductItem(
                        tag: product["id"],
                        title: product["title"],
                        description: product["description"],
                        calory: product["calories"],
                        price: product["price"],
                        image: product["image"],
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
