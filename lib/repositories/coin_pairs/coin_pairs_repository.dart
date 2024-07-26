import 'package:binance_app/dependency_injection/app_component.dart';
import 'package:binance_app/services/binance_ws_api/binance_ws_api.dart';

import 'abstract_coin_pairs_repository.dart';

class CoinPairsRepository implements AbstractCoinPairsRepository {
  final BinanceWSApi apiClient;

  CoinPairsRepository({required this.apiClient});

  @override
  Stream connectTradeWS() {
    final channel = getIt.get<BinanceWSApi>().coinPairsTickerSocket;
    return channel.stream;
  }

  @override
  void disconnectTradeWS() {
    final channel = getIt.get<BinanceWSApi>().coinPairsTickerSocket;
    channel.sink.close();
  }
}
