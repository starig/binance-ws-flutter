import 'package:binance_app/config/constants.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWSApi {
  final WebSocketChannel coinPairsTickerSocket = WebSocketChannel.connect(Uri.parse(
      '${Constants.baseUrl!}/stream?streams=btcusdt@miniTicker/ethusdt@miniTicker/xrpusdt@miniTicker/bnbusdt@miniTicker'));
}
