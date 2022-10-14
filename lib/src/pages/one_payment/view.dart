import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:paywall_ui/paywall_ui.dart';
import 'package:paywall_ui/src/controllers/paywall.dart';
import 'package:paywall_ui/src/widgets/preloader.dart';

class OnePaymentPage extends GetView {
  /// paywall based on adatpy.io concept
  /// https://assets.website-files.com/5fcd41506ada3883d9750822/62727b960c1a012e9923707b_headspace-paywall.png

  final Widget? mediaContainer;
  final BoxDecoration? mainContainerDecoration; // main container decoration
  final PaywallSettings paywallSettings; // paywall settings
  final OTPPaywallStyle? paywallStyle;
  final List<String> features;
  final String mainTitle;
  final String textButtonCTA;

  OnePaymentPage({
    Key? key,
    required this.mediaContainer,
    required this.features,
    required this.paywallSettings,
    this.mainContainerDecoration,
    this.paywallStyle,
    required this.mainTitle,
    required this.textButtonCTA,
  }) : super(key: key);

  final paywallController = Get.put<PaywallController>(PaywallController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paywallStyle?.scaffoldBackground ?? Colors.black,
      body: Stack(
        children: [
          SafeArea(
            top: false,
            bottom: false,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: Get.width,
                height: Get.height,
                decoration: mainContainerDecoration ??
                    BoxDecoration(
                      gradient: paywallStyle?.linearGradientContainer ??
                          LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              paywallStyle?.linearGradientColor ?? Colors.black,
                              Colors.grey[900]!,
                              Colors.black,
                              Colors.black,
                            ],
                          ),
                    ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: Text(
                          mainTitle,
                          style: GoogleFonts.rubik(
                            color: paywallStyle?.titleColor ?? Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: paywallStyle?.titleSize ?? 26,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Spacer(),
                      mediaContainer ??
                          SizedBox(
                            width: Get.width,
                            child: Center(
                              child: FadeInDown(
                                child: const Icon(
                                  Iconsax.crown_14,
                                  size: 100,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                      const Spacer(),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < features.length; i++)
                            Text(
                              features[i],
                              style: Get.textTheme.bodyText1!.copyWith(
                                color: paywallStyle?.featuresColor ?? Colors.white.withOpacity(0.6),
                                fontSize: paywallStyle?.featuresSize ?? 14,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          paywallSettings.localizedPrice.tr,
                          style: GoogleFonts.roboto(
                            color: paywallStyle?.featuresColor ?? Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            fontSize: paywallStyle?.priceSize ?? 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      paywallSettings.disableDefaultMessages
                          ? Container()
                          : paywallSettings.isSubscription
                              ? Container()
                              : Text(
                                  "Lifetime Access. No subscriptions.".tr,
                                  style: GoogleFonts.lato(
                                    color: paywallStyle?.featuresColor ?? Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                      paywallSettings.isSubscription
                          ? Container()
                          : const SizedBox(
                              height: 4,
                            ),
                      paywallSettings.disableDefaultMessages
                          ? Container()
                          : Text(
                              "Family Sharing (Up to 6 members)".tr,
                              style: GoogleFonts.lato(
                                color: paywallStyle?.featuresColor ?? Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flash(
                        delay: const Duration(seconds: 2),
                        infinite: true,
                        duration: const Duration(seconds: 5),
                        //animate: true,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: ElevatedButton(
                              style: paywallStyle?.buttonStyle ??
                                  ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                                    minimumSize: const Size(240, 40),
                                    primary: Colors.yellow[800],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    shadowColor: Colors.deepOrange,
                                    elevation: 8.0,
                                  ),
                              onPressed: () => paywallController.baseFunction(paywallSettings.onPressedPurchaseButton),
                              // icon: paywallStyle?.iconButtonCTA ??
                              //     const Icon(
                              //       Icons.verified_user_outlined,
                              //       color: Colors.white,
                              //       size: 32,
                              //     ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 14.0),
                                      child: Text(
                                        textButtonCTA,
                                        style: paywallStyle?.textStyleButtonCTA ??
                                            GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,
                                            ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          paywallSettings.disableProtectedMsg
                              ? Container()
                              : const Icon(
                                  Icons.verified_user_outlined,
                                  color: Colors.white,
                                  size: 12,
                                ),
                          const SizedBox(
                            width: 8,
                          ),
                          paywallSettings.disableProtectedMsg
                              ? Container()
                              : Text(
                                  "Protected by iTunes.".tr,
                                  style: GoogleFonts.roboto(
                                    color: paywallStyle?.featuresColor ?? Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () => paywallController.baseFunction(paywallSettings.onPressedRestoreButton),
                        child: Text(
                          "Restore".tr,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
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
                                  fontSize: 12,
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
                                  fontSize: 12,
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
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 24),
              child: Visibility(
                visible: paywallSettings.enabledBackButton, //() => paywallController.baseFunction(paywallSettings.onPressedPrivacyButton),
                child: SizedBox(
                  height: 30,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white.withOpacity(0.25),
                          ),
                          onPressed: () {
                            if (paywallSettings.onPressedBackButton != null) {
                              paywallSettings.onPressedBackButton!();
                            } else {
                              Get.back();
                            }
                          },
                        ),
                      ),
                      const Spacer(),
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
    );
  }
}
