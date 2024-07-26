import 'package:binance_app/repositories/coin_pairs/abstract_coin_pairs_repository.dart';
import 'package:binance_app/repositories/coin_pairs/coin_pairs_repository.dart';
import 'package:binance_app/services/binance_ws_api/binance_ws_api.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  _configureApiClients();
  _configureRepositories();
}

void _configureRepositories() {
  final binanceWSApi = getIt.get<BinanceWSApi>();
  getIt
    ..registerSingleton<AbstractCoinPairsRepository>(CoinPairsRepository(apiClient: binanceWSApi));
}

void _configureApiClients() {
  getIt..registerLazySingleton<BinanceWSApi>(() => BinanceWSApi());
}
