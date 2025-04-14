import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saporidiitalia/utils/color.dart';
import 'package:saporidiitalia/widgets/backward_button.dart';
import 'package:saporidiitalia/widgets/custom_quantity.dart';
import 'package:saporidiitalia/utils/constant.dart';
import 'package:saporidiitalia/pages/detail/detail_controller.dart';
import 'package:get/get.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody());
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(
        controller.data["title"],
        style: GoogleFonts.italiana(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0,
      leading: const BackwardButton(),
      actions: [
        Center(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(100),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  "assets/icons/bag-bold.svg",
                  color: primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height * 0.46,
                child: Image.asset("assets/images/product-background.jpg"),
              ),
              Container(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Hero(
                    tag: controller.data["id"],
                    child: Image.asset(
                      "assets/images/" + controller.data["image"],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
                left: spaceBetweenItems, right: spaceBetweenItems),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                _getProductInformation(),
                SizedBox(height: 30),
                _getDetail(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProductInformation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _getIcon(icon: "fire.png", title: controller.data["calories"]),
                SizedBox(width: 15),
                _getIcon(icon: "star.png", title: "5.0"),
              ],
            ),
            Text(
              "\$" + controller.data["price"],
              style: GoogleFonts.italiana(
                color: primary,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getIcon(icon: "clock.png", title: "20-30 mins"),
            CustomQuantity(),
          ],
        ),
      ],
    );
  }

  Widget _getDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Information",
          style: GoogleFonts.italiana(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          controller.data["information"] ?? "No information available",
          style: GoogleFonts.italiana(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  _getIcon({String icon = "", String title = ""}) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          child: Image.asset("assets/images/" + icon),
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.italiana(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
