import 'package:flutter/material.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/provider/category_provider.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/provider/theme_provider.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/provider/top_seller_provider.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/utill/color_resources.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/view/screen/home/widget/seller_card.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopSellerView extends StatelessWidget {
  final bool isHomePage;
  const TopSellerView({Key? key, required this.isHomePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TopSellerProvider>(
      builder: (context, topSellerProvider, child) {
        return topSellerProvider.topSellerList.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (1 / 1),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount:
                    isHomePage && topSellerProvider.topSellerList.length > 6
                        ? 6
                        : topSellerProvider.topSellerList.length,
                shrinkWrap: true,
                physics: isHomePage
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return SellerCard(
                      sellerModel: topSellerProvider.topSellerList[index]);
                },
              )
            : const SizedBox();
      },
    );
  }
}

class TopSellerShimmer extends StatelessWidget {
  const TopSellerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1 / 1),
      ),
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey[
                    Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200]!,
                spreadRadius: 2,
                blurRadius: 5)
          ]),
          margin: const EdgeInsets.all(3),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              flex: 7,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                enabled: Provider.of<TopSellerProvider>(context)
                    .topSellerList
                    .isEmpty,
                child: Container(
                    decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                )),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorResources.getTextBg(context),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: Provider.of<CategoryProvider>(context)
                        .categoryList
                        .isEmpty,
                    child: Container(
                        height: 10,
                        color: Colors.white,
                        margin: const EdgeInsets.only(left: 15, right: 15)),
                  ),
                )),
          ]),
        );
      },
    );
  }
}
