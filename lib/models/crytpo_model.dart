import 'package:flutter/material.dart';

class Currency {
  Currency({
    @required this.name,
    @required this.symbol,
    @required this.imageUrl,
    @required this.price,
    @required this.change,
    @required this.changePercentage,
  });

  String? name;
  String? symbol;
  String? imageUrl;
  String? price;
  String? change;
  String? changePercentage;

  factory Currency.fromJson(Map<String, dynamic> json, String interval) {
    return Currency(
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['logo_url'],
      price: json['price'],
      change: json[interval]['price_change'],
      changePercentage: json[interval]['price_change_pct'],
    );
  }
}

List<Currency> currList = [];