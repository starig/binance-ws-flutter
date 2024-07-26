import 'package:binance_app/models/coin_data/coin_data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

enum CoinStream {
  @JsonValue('btcusdt@miniTicker')
  BTC,
  @JsonValue('ethusdt@miniTicker')
  ETH,
  @JsonValue('xrpusdt@miniTicker')
  XRP,
  @JsonValue('bnbusdt@miniTicker')
  BNB,
  @JsonValue('')
  Default,
}

@JsonSerializable()
class Coin extends Equatable {
  const Coin({required this.stream, required this.data});

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  @JsonKey(unknownEnumValue: CoinStream.Default)
  final CoinStream stream;
  final CoinData data;

  Map<String, dynamic> toJson() => _$CoinToJson(this);

  @override
  List<Object> get props => [stream];
}
