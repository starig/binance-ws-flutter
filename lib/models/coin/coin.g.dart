// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
      stream: $enumDecode(_$CoinStreamEnumMap, json['stream'],
          unknownValue: CoinStream.Default),
      data: CoinData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'stream': _$CoinStreamEnumMap[instance.stream]!,
      'data': instance.data,
    };

const _$CoinStreamEnumMap = {
  CoinStream.BTC: 'btcusdt@miniTicker',
  CoinStream.ETH: 'ethusdt@miniTicker',
  CoinStream.XRP: 'xrpusdt@miniTicker',
  CoinStream.BNB: 'bnbusdt@miniTicker',
  CoinStream.Default: '',
};
