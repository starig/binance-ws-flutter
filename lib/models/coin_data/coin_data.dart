import 'package:json_annotation/json_annotation.dart';

part 'coin_data.g.dart';

@JsonSerializable()
class CoinData {
  const CoinData({
    required this.c,
    required this.o,
    required this.q,
    required this.s,
  });

  factory CoinData.fromJson(Map<String, dynamic> json) => _$CoinDataFromJson(json);

  final String c;
  final String o;
  final String q;
  final String s;

  Map<String, dynamic> toJson() => _$CoinDataToJson(this);
}
