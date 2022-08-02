library paywall_ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paywall_ui/src/pages/multiple_options/view.dart';
import 'package:paywall_ui/src/pages/one_time_payment/view.dart';
import 'package:paywall_ui/src/types/paywall_settings.dart';

import 'src/types/paywall_style.dart';

// exports
export 'package:paywall_ui/src/types/paywall_settings.dart';
export 'package:paywall_ui/src/types/paywall_style.dart';

class PaywallUi {
  final Translations? translations;
  PaywallUi({
    this.translations,
  });

  Widget multipleOptions({
    required PaywallSettings paywallSettings,
    required List<String> features,
    Widget? mediaContainer,
    BoxDecoration? mainContainerDecoration,
    MultiplePaywallStyle? paywallStyle,
  }) {
    return MultipleOptionsPage(
      paywallSettings: paywallSettings,
      mediaContainer: mediaContainer,
      mainContainerDecoration: mainContainerDecoration,
      features: features,
      paywallStyle: paywallStyle,
    );
  }

  Widget oneTimePayment({
    required PaywallSettings paywallSettings,
    required List<String> features,
    Widget? mediaContainer,
    BoxDecoration? mainContainerDecoration,
    OTPPaywallStyle? paywallStyle,
  }) {
    return OneTimePaymentPage(
      paywallSettings: paywallSettings,
      mediaContainer: mediaContainer,
      mainContainerDecoration: mainContainerDecoration,
      features: features,
      paywallStyle: paywallStyle,
    );
  }

  Widget defaultWrapper({required Widget child, Brightness? brightness}) {
    return MaterialApp(
      locale: Get.locale,
      home: child,
    );
  }
}
