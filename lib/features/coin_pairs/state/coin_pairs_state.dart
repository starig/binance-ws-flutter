part of 'coin_pairs_cubit.dart';

class CoinPairsState {
  List<Coin> coins;
  List<Coin> filteredCoins;

  CoinPairsState({
    required this.coins,
    required this.filteredCoins,
  });

  CoinPairsState copyWith({
    List<Coin>? coins,
    List<Coin>? filteredCoins,
  }) {
    return CoinPairsState(
      coins: coins ?? this.coins,
      filteredCoins: filteredCoins ?? this.filteredCoins,
    );
  }
}
