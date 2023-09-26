import 'package:flutter/material.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/data/model/response/config_model.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/provider/splash_provider.dart';
import 'package:flutter_ElBaklawyPharmacies_ecommerce/utill/dimensions.dart';
import 'package:provider/provider.dart';

import 'marque_text.dart';

/// يعرض هذا الويدجت إعلانًا.
class AnnouncementScreen extends StatelessWidget {
  /// بيانات الإعلان.
  final Announcement? announcement;

  /// ينشئ ويدجت إعلان.
  const AnnouncementScreen({Key? key, this.announcement}) : super(key: key);

  @override

  /// يبني الويدجت.
  Widget build(BuildContext context) {
    // يحصل على لون ولون النص للإعلان من كائن announcement.
    String color = announcement!.color!.replaceAll('#', '0xff');
    String textColor = announcement!.textColor!.replaceAll('#', '0xff');

    // ينشئ ويدجت Container بلون محدد.
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse(color)),
      ),
      child: Row(
        children: [
          // ينشئ ويدجت Expanded يحتوي على ويدجت MarqueeWidget.
          Expanded(
            child: MarqueeWidget(
              // يحدد اتجاه النص للتحرك.
              direction: Axis.horizontal,
              // ينشئ ويدجت Padding يضيف مسافة بين النص والحواف.
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.paddingSizeDefault,
                ),
                // ينشئ ويدجت Text ويعرض نص الإعلان.
                child: Text(
                  announcement!.announcement!,
                  // يحدد لون النص.
                  style: TextStyle(color: Color(int.parse(textColor))),
                ),
              ),
            ),
          ),
          // ينشئ ويدجت Container يحتوي على ويدجت InkWell.
          Container(
            width: 40,
            padding: const EdgeInsets.all(10),
            child: Center(
              // ينشئ ويدجت InkWell وينشئ زر يمكن النقر عليه.
              child: InkWell(
                onTap: () {
                  // يستدعي طريقة changeAnnouncementOnOff() لفئة SplashProvider.
                  // تقوم هذه الطريقة على تغيير حالة الإعلان إلى false، مما يخفي الإعلان.
                  Provider.of<SplashProvider>(context, listen: false)
                      .changeAnnouncementOnOff(false);
                },
                child: Text(
                  // يعرض نص الزر.
                  'ok',
                  // يحدد لون النص.
                  style: TextStyle(color: Color(int.parse(textColor))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
