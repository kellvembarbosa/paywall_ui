<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package was created to facilitate the development of new paywalls

## Features

Currently the plugin has only 2 layouts.
    - OTP for an OTP preferred payment option.
    - Multiple Options, ideal for 2 or 3 subscription offers or OTP Subscription.
    -- Multiple Options has vertical layout (default) and horizontal layout.

## Getting started

Requisitos padrões

## Usage

Include short and useful examples for package users.

on example path: ``lib/app/modules/paywall/view.dart``

```dart
    Container(
        child: PaywallUi().oneTimePayment(
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
        ),
    )
```

## Additional information
You can build with this package by opening a pr on github.
# paywall_ui
