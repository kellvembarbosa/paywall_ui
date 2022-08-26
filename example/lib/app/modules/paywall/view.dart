import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paywall_ui/paywall_ui.dart';

import '../home/controller.dart';

class PaywallPage extends GetView<HomeController> {
  PaywallPage({Key? key}) : super(key: key);

  final paywallUi = PaywallUi();
  final arguments = Get.arguments;

  final layoutPaywall = LayoutMultiple.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        switch (arguments['type'] as String) {
          case "multiple":
            return Obx(
              () => paywallUi.multipleOptions(
                currentOfferSelected: controller.currentOfferValue,
                optionsLayout: arguments['orientation'] == 'horizontal' ? LayoutMultiple.horizontal : LayoutMultiple.vertical,
                offerRecommended: 2,
                offers: arguments['orientation'] == 'horizontal'
                    ? [
                        PaywallButtonOffer(
                          title: "1",
                          subtitle: "Month",
                          description: "Automatically renews every month",
                          price: "4.99 \$",
                          onPressed: () {
                            controller.setCurrentOffer(0);

                            /// to make purchase or cta
                            /// call.purchase(); if you want to make purchase this selected offer
                          },
                        ),
                        PaywallButtonOffer(
                          title: "7",
                          description: "After trials \$ 4.99 per month",
                          subtitle: "Days",
                          price: "FREE",
                          onPressed: () {
                            controller.setCurrentOffer(1);

                            /// to make purchase or cta
                            /// call.purchase();
                          },
                        ),
                        PaywallButtonOffer(
                          title: "oo",
                          description: "Pay one-time and unlock all faces",
                          subtitle: "Lifetime",
                          price: "\$ 14.99",
                          onPressed: () {
                            controller.setCurrentOffer(2);

                            /// to make purchase or cta
                            /// call.purchase();
                          },
                        ),
                      ]
                    : [
                        PaywallButtonOffer(
                          title: "Lifetime",
                          subtitle: "Pay one-time and unlock all faces",
                          price: "\$ 4.99",
                          onPressed: () {
                            controller.setCurrentOffer(0);

                            /// to make purchase or cta
                            /// call.purchase();
                          },
                        ),
                        PaywallButtonOffer(
                          title: "3-Day Trial",
                          subtitle: "After trials \$ 4.99 per month",
                          price: "FREE",
                          onPressed: () {
                            controller.setCurrentOffer(1);

                            /// to make purchase or cta
                            /// call.purchase();
                          },
                        ),
                        PaywallButtonOffer(
                          title: "1 Year",
                          subtitle: "Automatically renews every year",
                          price: "\$ 14.99",
                          onPressed: () {
                            controller.setCurrentOffer(2);

                            /// to make purchase or cta
                            /// call.purchase(); if you want to make purchase this selected offer
                          },
                        ),
                      ],
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
                  onPressedPurchaseButton: () async {
                    /// to make purchase or cta
                    /// get current offer by controller.currentOfferValue
                    /// call.purchase(products[controller.currentOfferValue]);
                    await Future.delayed(const Duration(seconds: 3));
                  },
                  onPressedRestoreButton: () async => await Future.delayed(const Duration(seconds: 3)),
                  onPressedPrivacyButton: () => Get.defaultDialog(title: "Privacy Policy", middleText: "Privacy Policy Link", actions: [
                    CupertinoButton(child: const Text("OK"), onPressed: () => Get.back()),
                  ]),
                  onPressedTermsButton: () => Get.defaultDialog(title: "Terms of Use", middleText: "Terms of Use Link", actions: [
                    CupertinoButton(child: const Text("OK"), onPressed: () => Get.back()),
                  ]),
                ),
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
                onPressedPurchaseButton: () async {
                  /// to make purchase on cta
                  /// call.purchase(product);
                  await Future.delayed(const Duration(seconds: 3));
                },
                onPressedRestoreButton: () async => await Future.delayed(const Duration(seconds: 3)),
                onPressedPrivacyButton: () => Get.defaultDialog(title: "Privacy Policy", middleText: "Privacy Policy Link"),
                onPressedTermsButton: () => Get.defaultDialog(title: "Terms of Use", middleText: "Terms of Use Link"),
              ),
            );
        }
      }),
    );
  }
}
