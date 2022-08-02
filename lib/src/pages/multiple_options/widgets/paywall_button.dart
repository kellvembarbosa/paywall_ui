import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaywallButtonWidget extends StatelessWidget {
  final bool isSelected;
  const PaywallButtonWidget({Key? key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
              border: isSelected
                  ? Border.all(
                      color: Colors.deepOrangeAccent,
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          '3-Day Trial',
                          style: Get.textTheme.bodyMedium!.copyWith(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          'After trial ends \$4.99 per month',
                          style: Get.textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
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
                      "FREE",
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontSize: 18,
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
            ? const Padding(
                padding: EdgeInsets.all(6.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 18,
                  ),
                ),
              )
            : const Padding(
                padding: EdgeInsets.all(6.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              ),
      ],
    );
  }
}
