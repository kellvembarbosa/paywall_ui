import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/paywall.dart';
import '../../../types/paywall_offers.dart';

class PaywallButtonVerticalWidget extends StatelessWidget {
  final bool isSelected;
  final PaywallButtonOffer offer;
  PaywallButtonVerticalWidget({Key? key, this.isSelected = false, required this.offer}) : super(key: key);
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
            height: 65,
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
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          offer.title,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            color: isSelected ? offer.titleColor ?? Colors.white : offer.textInactiveColor ?? Colors.grey,
                            fontSize: offer.titleSize ?? 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          offer.subtitle,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            color: isSelected ? offer.subtitleColor ?? Colors.grey : offer.textInactiveColor ?? Colors.grey,
                            fontSize: offer.subtitleSize ?? 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      offer.price,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: isSelected ? offer.priceColor ?? Colors.white : offer.textInactiveColor ?? Colors.grey,
                        fontSize: offer.priceSize ?? 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        isSelected
            ? Padding(
                padding: const EdgeInsets.all(6.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.check_circle,
                    color: offer.checkIconColorActive ?? Colors.green,
                    size: 18,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
