import 'package:flutter/foundation.dart';

class PaywallSettings with Diagnosticable {
  final String localizedPrice, localizedSubscriptionPeriod;
  final Function? onPressedPurchaseButton, onPressedRestoreButton, onPressedTermsButton, onPressedPrivacyButton, onPressedBackButton;
  final bool enabledBackButton, isSubscription; // disable back button on paywall page

  PaywallSettings({
    required this.localizedPrice,
    this.localizedSubscriptionPeriod = 'one-time',
    this.onPressedPurchaseButton,
    this.onPressedRestoreButton,
    this.onPressedTermsButton,
    this.onPressedPrivacyButton,
    this.onPressedBackButton,
    this.enabledBackButton = true,
    this.isSubscription = false,
  });
}
