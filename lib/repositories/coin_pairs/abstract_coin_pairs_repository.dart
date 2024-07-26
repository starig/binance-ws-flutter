abstract interface class AbstractCoinPairsRepository {
  Stream connectTradeWS();
  void disconnectTradeWS();
}
