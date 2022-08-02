import 'package:example/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: AppPages.pages,
      initialRoute: Routes.HOME,
      fallbackLocale: const Locale('en', 'US'),
      locale: Get.locale,
      defaultTransition: Transition.cupertino,
    ),
  );
}
