import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:paywall_ui/paywall_ui.dart';
import 'package:paywall_ui/src/controllers/paywall.dart';
import 'package:paywall_ui/src/widgets/preloader.dart';

class OneTimePaymentPage extends GetView {
  /// paywall based on adatpy.io concept
  /// https://assets.website-files.com/5fcd41506ada3883d9750822/62727b960c1a012e9923707b_headspace-paywall.png

  final Widget? mediaContainer;
  final BoxDecoration? mainContainerDecoration; // main container decoration
  final PaywallSettings paywallSettings; // paywall settings
  final OTPPaywallStyle? paywallStyle;
  final List<String> features;
  final String mainTitle;
  final String textButtonCTA;

  OneTimePaymentPage({
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
            child: SingleChildScrollView(
              child: Container(
                decoration: mainContainerDecoration ??
                    BoxDecoration(
                      gradient: paywallStyle?.linearGradientContainer ??
                          LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              paywallStyle?.linearGradientColor ?? Colors.blue,
                              Colors.black,
                              Colors.black,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0, right: 6),
                      child: Text(
                        mainTitle,
                        style: GoogleFonts.rubik(
                          color: paywallStyle?.titleColor ?? Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: paywallStyle?.titleSize ?? 24,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
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
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get for @price".trParams(
                            {
                              "price": "${paywallSettings.localizedPrice.tr} ${paywallSettings.localizedSubscriptionPeriod.tr}",
                            },
                          ),
                          style: GoogleFonts.openSans(
                            color: paywallStyle?.featuresColor ?? Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: paywallStyle?.priceSize ?? 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    paywallSettings.isSubscription
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
                    Text(
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
                    SlideInLeft(
                      child: ElevatedButton(
                        style: paywallStyle?.buttonStyle ??
                            ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                              surfaceTintColor: Colors.white,
                              minimumSize: const Size(240, 40),
                              primary: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                        onPressed: () => paywallController.baseFunction(paywallSettings.onPressedPurchaseButton),
                        // icon: paywallStyle?.iconButtonCTA ??
                        //     const Icon(
                        //       Icons.verified_user_outlined,
                        //       color: Colors.white,
                        //       size: 32,
                        //     ),
                        child: Text(
                          textButtonCTA,
                          style: paywallStyle?.textStyleButtonCTA ??
                              GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                        const Icon(
                          Icons.verified_user_outlined,
                          color: Colors.white,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
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
                      height: 20,
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
                          onPressed: () {
                            if (paywallSettings.onPressedBackButton != null) {
                              paywallSettings.onPressedBackButton!();
                            } else {
                              Get.back();
                            }
                          },
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
    );
  }
}
