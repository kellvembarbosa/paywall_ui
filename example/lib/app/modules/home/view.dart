import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paywalls with GETX'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Demo paywalls',
                style: Get.textTheme.titleLarge,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  child: const Text('Show paywall ONE OPTION'),
                  onPressed: () => Get.toNamed('/paywall', arguments: {'type': 'one'}),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  child: const Text('Show paywall OTP'),
                  onPressed: () => Get.toNamed('/paywall', arguments: {'type': 'otp'}),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  child: const Text('Show paywall Multiple Options Horizontal'),
                  onPressed: () => Get.toNamed('/paywall', arguments: {'type': 'multiple', 'orientation': 'horizontal'}),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  child: const Text('Show paywall Multiple Options Vertical'),
                  onPressed: () => Get.toNamed('/paywall', arguments: {'type': 'multiple', 'orientation': 'vertical'}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
