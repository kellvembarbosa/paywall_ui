import 'package:flutter/material.dart';

class PaywallButtonOffer {
  final String title;
  final String subtitle;
  final String price;
  final String? description;
  final String? recommendedText;

  final BoxDecoration? mainContainerDecoration, recommendedContainerDecoration;
  final TextStyle? titleStyle, subtitleStyle, priceStyle;

  final Color? bgMainContainerColor,
      titleColor,
      subtitleColor,
      priceColor,
      borderColor,
      checkIconColorInactive,
      checkIconColorActive,
      textInactiveColor,
      recommendedBgColor,
      recommendedTextColor;

  final double? titleSize, subtitleSize, priceSize, descriptionSize, recommendedSize;

  final int? borderWidth;

  final Function? onPressed;
  final ButtonStyle? buttonStyle;

  PaywallButtonOffer({
    required this.title,
    required this.subtitle,
    required this.price,
    this.description,
    this.mainContainerDecoration,
    this.titleStyle,
    this.subtitleStyle,
    this.priceStyle,
    this.bgMainContainerColor,
    this.titleColor,
    this.subtitleColor,
    this.priceColor,
    this.borderColor,
    this.borderWidth,
    this.checkIconColorInactive,
    this.checkIconColorActive,
    this.textInactiveColor,
    this.onPressed,
    this.buttonStyle,
    this.recommendedContainerDecoration,
    this.recommendedBgColor,
    this.recommendedText,
    this.recommendedTextColor,
    this.recommendedSize,
    this.descriptionSize,
    this.titleSize,
    this.subtitleSize,
    this.priceSize,
  });
}
