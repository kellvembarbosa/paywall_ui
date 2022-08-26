import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/paywall.dart';
import '../../../types/paywall_offers.dart';

class PaywallButtonHorizontalWidget extends StatelessWidget {
  final bool isSelected;
  final bool isRecommended;
  final PaywallButtonOffer offer;
  PaywallButtonHorizontalWidget({Key? key, this.isSelected = false, required this.offer, this.isRecommended = false}) : super(key: key);
  final controller = Get.find<PaywallController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextButton(
          onPressed: () => controller.baseFunction(offer.onPressed),
          style: offer.buttonStyle ??
              TextButton.styleFrom(
                primary: offer.bgMainContainerColor ?? Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
          child: Container(
            height: isRecommended ? 150 : 120,
            width: Get.width * 0.27,
            decoration: offer.mainContainerDecoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: offer.bgMainContainerColor ?? Colors.black,
                  border: isSelected
                      ? Border.all(
                          color: offer.borderColor ?? Colors.deepOrangeAccent,
                          width: 2,
                        )
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1.0),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: isRecommended ? 15 : 0,
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      offer.title,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: isSelected ? offer.titleColor ?? Colors.white : offer.textInactiveColor ?? Colors.grey,
                        fontSize: offer.titleSize ?? 28,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      offer.subtitle,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: isSelected ? offer.subtitleColor ?? Colors.grey : offer.textInactiveColor ?? Colors.grey,
                        fontSize: offer.subtitleSize ?? 13,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Flexible(
                    child: Text(
                      offer.price,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: isSelected ? offer.titleColor ?? Colors.white : offer.textInactiveColor ?? Colors.grey,
                        fontSize: offer.priceSize ?? 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        isRecommended
            ? Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 25,
                  width: Get.width * 0.27,
                  decoration: offer.recommendedContainerDecoration ??
                      BoxDecoration(
                        color: offer.recommendedBgColor ?? Colors.deepOrangeAccent,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        border: Border.all(
                          color: offer.recommendedBgColor ?? Colors.deepOrangeAccent,
                          width: 2,
                        ),
                      ),
                  child: Center(
                    child: Text(
                      offer.recommendedText ?? "POPULAR".tr,
                      style: Get.textTheme.titleSmall!.copyWith(
                        color: offer.recommendedTextColor ?? Colors.white,
                        fontSize: offer.recommendedSize ?? 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            : Container()
        // : Padding(
        //     padding: const EdgeInsets.all(6.0),
        //     child: Align(
        //       alignment: Alignment.topRight,
        //       child: Icon(
        //         Icons.circle_outlined,
        //         color: offer.checkIconColorInactive ?? Colors.grey,
        //         size: 18,
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
