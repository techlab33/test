import 'package:flutter/material.dart';
import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:glassfy_flutter/models.dart';

class PurchaseApi {
  static const _apiKey = '10a41ed98d0643239e93f8cb086a0588';
//5b7451295128467798c93ecf8760fa6a
  static Future<void> init() async {
    await Glassfy.initialize(_apiKey, watcherMode: false);
  }

  static Future<List<GlassfyOffering>> fetchOffers() async {
    try {
      final offerings = await Glassfy.offerings();
      return offerings.all ?? [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  static Future<GlassfyTransaction?> purchaseSku(GlassfySku sku) async {
    try {
      return await Glassfy.purchaseSku(sku);
    } catch (e) {
      return null;
    }
  }
}
