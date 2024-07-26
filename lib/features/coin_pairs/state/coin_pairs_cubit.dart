import 'dart:async';
import 'dart:convert';

import 'package:binance_app/dependency_injection/app_component.dart';
import 'package:binance_app/models/coin/coin.dart';
import 'package:binance_app/repositories/coin_pairs/abstract_coin_pairs_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'coin_pairs_state.dart';

class CoinPairsCubit extends Cubit<CoinPairsState> {
  CoinPairsCubit()
      : super(
          CoinPairsState(
            coins: [],
            filteredCoins: [],
          ),
        );

  final AbstractCoinPairsRepository coinPairsRepository = getIt.get<AbstractCoinPairsRepository>();
  late final WebSocketChannel channel;

  listenStream(Stream stream) {
    stream.listen((data) {
      final jsonData = jsonDecode(data);
      if (jsonData != null) {
        final Coin coin = Coin.fromJson(jsonData);
        if (state.coins.contains(coin)) {
          final prevCoin = state.coins.firstWhere((prev) => prev.stream == coin.stream);
          final indexOfCoin = state.coins.indexOf(prevCoin);
          state.coins[indexOfCoin] = coin;
          emit(state.copyWith(coins: state.coins));
        } else {
          state.coins.add(coin);
          emit(state.copyWith(coins: state.coins));
        }
      }
    });
  }

  searchByQuery(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(filteredCoins: state.coins));
    } else {
      final List<Coin> _filteredCoins = state.coins
          .where((item) => item.stream.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(state.copyWith(filteredCoins: _filteredCoins));
    }
  }

  Stream connectWS() {
    return coinPairsRepository.connectTradeWS();
  }

  void disconnectWS() {
    coinPairsRepository.disconnectTradeWS();
  }
}
