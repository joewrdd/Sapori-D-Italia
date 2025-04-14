import 'package:flutter/material.dart';
import 'package:saporidiitalia/utils/color.dart';
import 'package:saporidiitalia/routes/app_route_name.dart';
import 'package:saporidiitalia/routes/app_route_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const SaporiDItalia());
}

class SaporiDItalia extends StatelessWidget {
  const SaporiDItalia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutePage.routes,
      initialRoute: AppRouteName.login,
      theme: ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: white,
          titleTextStyle: TextStyle(color: black, fontSize: 20),
        ),
      ),
    );
  }
}
