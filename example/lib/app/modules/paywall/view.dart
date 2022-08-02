import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paywall_ui/paywall_ui.dart';

class PaywallPage extends GetView {
  PaywallPage({Key? key}) : super(key: key);

  final paywallUi = PaywallUi();
  final arguments = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        switch (arguments['type'] as String) {
          case "multiple":
            return paywallUi.multipleOptions(
              features: [
                '✅ Exclusive 🔥 crown',
                '✅ Get 4000+ faces',
                "✅ Get a new color",
              ],
              paywallStyle: MultiplePaywallStyle(
                featuresSize: 18,
                featuresColor: Colors.white,
              ),
              paywallSettings: PaywallSettings(
                localizedPrice: "\$ 4.99",
                onPressedBackButton: () => Get.back(),
              ),
            );
          default:
            return paywallUi.oneTimePayment(
              features: ['🔓 feature1', '⌚️ feature2'],
              paywallStyle: OTPPaywallStyle(
                featuresSize: 18,
              ),
              paywallSettings: PaywallSettings(
                localizedPrice: "\$ 4.99",
                onPressedBackButton: () => Get.back(),
              ),
            );
        }
      }),
    );
  }
}
