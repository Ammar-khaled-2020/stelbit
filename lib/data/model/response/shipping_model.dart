import 'package:flutter_ElBaklawyPharmacies_ecommerce/data/model/response/shipping_method_model.dart';

class ShippingModel {
  int? shippingIndex;
  String? groupId;
  List<ShippingMethodModel>? shippingMethodList;

  ShippingModel(this.shippingIndex, this.groupId, this.shippingMethodList);
}
