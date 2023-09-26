import 'package:flutter/material.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/utill/custom_themes.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/utill/dimensions.dart';

class AmountWidget extends StatelessWidget {
  final String? title;
  final String amount;

  const AmountWidget({Key? key, required this.title, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeExtraSmall),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title!,
            style: titilliumRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault)),
        Text(amount,
            style: titilliumRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault)),
      ]),
    );
  }
}
