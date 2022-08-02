import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:paywall_ui/paywall_ui.dart';
import 'package:paywall_ui/src/controllers/paywall.dart';
import 'package:paywall_ui/src/pages/multiple_options/widgets/paywall_button.dart';
import 'package:paywall_ui/src/widgets/preloader.dart';

class MultipleOptionsPage extends GetView {
  /// paywall based on adatpy.io concept
  /// https://assets.website-files.com/5fcd41506ada3883d9750822/62727b960c1a012e9923707b_headspace-paywall.png

  final Widget? mediaContainer;
  final BoxDecoration? mainContainerDecoration; // main container decoration
  final PaywallSettings paywallSettings; // paywall settings
  final MultiplePaywallStyle? paywallStyle;
  final List<String> features;

  MultipleOptionsPage({
    Key? key,
    required this.mediaContainer,
    required this.features,
    required this.paywallSettings,
    this.mainContainerDecoration,
    this.paywallStyle,
  }) : super(key: key);

  @override
  final paywallController = Get.put<PaywallController>(PaywallController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paywallStyle?.scaffoldBackground ?? const Color(0xFF1E1E1E),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: mainContainerDecoration ??
                    BoxDecoration(
                      gradient: paywallStyle?.linearGradientContainer ??
                          LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              paywallStyle?.linearGradientColor ?? const Color(0xFF1E1E1E),
                              const Color(0xFF1E1E1E),
                              const Color(0xFF1E1E1E),
                            ],
                          ),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    mediaContainer ??
                        SizedBox(
                          height: 250,
                          width: Get.width,
                          child: FadeInDown(
                            child: const Center(
                              child: Icon(
                                Iconsax.crown_14,
                                size: 100,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ),
                    Text(
                      "Try 3 days FREE".tr,
                      style: Get.textTheme.titleLarge!.copyWith(
                        color: paywallStyle?.titleColor ?? Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: paywallStyle?.titleSize ?? 24,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "No commitment. Cancel anytime".tr,
                      style: Get.textTheme.subtitle1!.copyWith(
                        color: paywallStyle?.subtitleColor ?? Colors.white,
                        fontSize: paywallStyle?.subtitleSize ?? 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < features.length; i++)
                          Text(
                            features[i],
                            style: Get.textTheme.bodyText1!.copyWith(
                              color: paywallStyle?.featuresColor ?? Colors.white,
                              fontSize: paywallStyle?.featuresSize ?? 16,
                            ),
                            textAlign: paywallStyle?.featuresTextAlign ?? TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          PaywallButtonWidget(),
                          PaywallButtonWidget(
                            isSelected: true,
                          ),
                          PaywallButtonWidget(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SlideInLeft(
                      child: ElevatedButton(
                        style: paywallStyle?.buttonStyle ??
                            ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                              surfaceTintColor: Colors.white,
                              minimumSize: const Size(260, 50),
                              primary: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              shadowColor: Colors.black,
                            ),
                        onPressed: () => paywallController.baseFunction(paywallSettings.onPressedPurchaseButton),
                        child: Text(
                          "Try Now".tr,
                          style: paywallStyle?.textStyleButtonCTA ??
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () => paywallController.baseFunction(paywallSettings.onPressedTermsButton),
                            child: Text(
                              "Terms of Use".tr,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[500]!,
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => paywallController.baseFunction(paywallSettings.onPressedRestoreButton),
                            child: Text(
                              "Restore".tr,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => paywallController.baseFunction(paywallSettings.onPressedPrivacyButton),
                            child: Text(
                              "Privacy Policy".tr,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[500]!,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Visibility(
                  visible: paywallSettings.enabledBackButton, //() => paywallController.baseFunction(paywallSettings.onPressedPrivacyButton),
                  child: SizedBox(
                    height: 30,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            child: const Icon(
                              Icons.close,
                              color: Colors.black45,
                            ),
                            onPressed: () => Get.back(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: paywallController.loading,
                child: const PreloaderWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
