import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OTPPaywallStyle with Diagnosticable {
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? priceStyle;
  final TextStyle? textStyleButtonCTA;

  /// ButtonStyle for CTA
  final ButtonStyle? buttonStyle;

  /// degrade effect for header
  final LinearGradient? linearGradientContainer;

  final Brightness? brightness;

  // Colors
  final Color? scaffoldBackground, titleColor, descriptionColor, priceColor, featuresColor, linearGradientColor;

  // Fonts Sizes
  final double titleSize, descriptionSize, priceSize, featuresSize;

  // icons
  final Icon? iconButtonCTA;

  OTPPaywallStyle({
    this.titleStyle,
    this.descriptionStyle,
    this.priceStyle,
    this.textStyleButtonCTA,
    this.buttonStyle,
    this.scaffoldBackground,
    this.brightness,
    this.titleColor,
    this.descriptionColor,
    this.priceColor,
    this.featuresColor,
    this.titleSize = 28,
    this.descriptionSize = 16,
    this.priceSize = 18,
    this.featuresSize = 16,
    this.linearGradientContainer,
    this.linearGradientColor,
    this.iconButtonCTA,
  });
}

class MultiplePaywallStyle with Diagnosticable {
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? priceStyle;
  final TextStyle? textStyleButtonCTA;

  // text aligns
  final TextAlign? featuresTextAlign;

  /// ButtonStyle for CTA
  final ButtonStyle? buttonStyle;

  /// degrade effect for header
  final LinearGradient? linearGradientContainer;

  final Brightness? brightness;

  // Colors
  final Color? scaffoldBackground, titleColor, subtitleColor, priceColor, featuresColor, linearGradientColor;

  // Fonts Sizes
  final double titleSize, subtitleSize, priceSize, featuresSize;

  // icons
  final Icon? iconButtonCTA;

  MultiplePaywallStyle({
    this.titleStyle,
    this.descriptionStyle,
    this.priceStyle,
    this.featuresTextAlign,
    this.textStyleButtonCTA,
    this.buttonStyle,
    this.scaffoldBackground,
    this.brightness,
    this.titleColor,
    this.subtitleColor,
    this.priceColor,
    this.featuresColor,
    this.titleSize = 28,
    this.subtitleSize = 18,
    this.priceSize = 18,
    this.featuresSize = 16,
    this.linearGradientContainer,
    this.linearGradientColor,
    this.iconButtonCTA,
  });
}
