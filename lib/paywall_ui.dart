library paywall_ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paywall_ui/paywall_ui.dart';
import 'package:paywall_ui/src/pages/multiple_options/view.dart';
import 'package:paywall_ui/src/pages/one_time_payment/view.dart';
import 'package:paywall_ui/src/types/paywall_offers.dart';
import 'package:paywall_ui/src/types/paywall_settings.dart';

import 'src/pages/one_payment/view.dart';
import 'src/types/paywall_style.dart';

// exports
export 'package:paywall_ui/src/types/paywall_settings.dart';
export 'package:paywall_ui/src/types/paywall_style.dart';
export 'package:paywall_ui/src/types/paywall_offers.dart';
export 'package:paywall_ui/src/utils/color.dart';
export 'package:paywall_ui/src/utils/enum.dart';

class PaywallUi {
  final Translations? translations;
  PaywallUi({
    this.translations,
  });

  Widget multipleOptions({
    required PaywallSettings paywallSettings,
    required List<PaywallButtonOffer> offers,
    List<String>? features,
    Widget? mediaContainer,
    BoxDecoration? mainContainerDecoration,
    MultiplePaywallStyle? paywallStyle,
    int currentOfferSelected = 0,
    LayoutMultiple optionsLayout = LayoutMultiple.vertical,
    int offerRecommended = 9999,
    String mainTitle = "Try 3 days FREE",
    String mainSubTitle = "No commitment. Cancel anytime",
    String textButtonCTA = "Try now",
  }) {
    return MultipleOptionsPage(
      paywallSettings: paywallSettings,
      mediaContainer: mediaContainer,
      offers: offers,
      mainContainerDecoration: mainContainerDecoration,
      features: features ?? ['✅ Exclusive Features 🔥 ', '✅ Get All Features', "✅  Exclusive content"],
      paywallStyle: paywallStyle,
      currentOfferSelected: currentOfferSelected,
      optionsLayout: optionsLayout,
      offerRecommended: offerRecommended,
      mainTitle: mainTitle,
      mainSubTitle: mainSubTitle,
      textButtonCTA: textButtonCTA,
    );
  }

  Widget oneTimePayment({
    required PaywallSettings paywallSettings,
    List<String>? features,
    Widget? mediaContainer,
    BoxDecoration? mainContainerDecoration,
    OTPPaywallStyle? paywallStyle,
    String mainTitle = "Unlock all watch faces for life",
    String textButtonCTA = "Buy now",
  }) {
    return OneTimePaymentPage(
      paywallSettings: paywallSettings,
      mediaContainer: mediaContainer,
      mainContainerDecoration: mainContainerDecoration,
      features: features ?? ['✅ Exclusive Features 🔥 ', '✅ Get All Features', "✅  Exclusive content"],
      paywallStyle: paywallStyle,
      mainTitle: mainTitle,
      textButtonCTA: textButtonCTA,
    );
  }

  Widget onePayment({
    required PaywallSettings paywallSettings,
    required List<String>? features,
    Widget? mediaContainer,
    BoxDecoration? mainContainerDecoration,
    OTPPaywallStyle? paywallStyle,
    String mainTitle = "Unlock All Faces",
    String textButtonCTA = "Continue",
  }) {
    return OnePaymentPage(
      paywallSettings: paywallSettings,
      mediaContainer: mediaContainer,
      mainContainerDecoration: mainContainerDecoration,
      features: features ?? ["Daily Gallery Updates".tr, "Live, Static, Dynamic Collections".tr, "No Ads".tr, "No Subscriptions".tr],
      paywallStyle: paywallStyle,
      mainTitle: mainTitle,
      textButtonCTA: textButtonCTA,
    );
  }

  Widget defaultWrapper({required Widget child, Brightness? brightness}) {
    return child;
  }
}
