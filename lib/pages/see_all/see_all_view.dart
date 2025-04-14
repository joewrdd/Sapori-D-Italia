import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:saporidiitalia/utils/constant.dart';
import 'package:saporidiitalia/data/product_data.dart';
import 'package:saporidiitalia/widgets/product_item.dart';
import 'package:saporidiitalia/routes/app_route_name.dart';
import 'package:saporidiitalia/widgets/backward_button.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Menu Items",
          style: GoogleFonts.italiana(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        leading: BackwardButton(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(spaceBetweenItems),
        child: Column(
          children: List.generate(
            PRODUCTS.length,
            (index) {
              var product = PRODUCTS[index];
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
        ),
      ),
    );
  }
}
