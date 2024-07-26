import 'package:binance_app/config/theme.dart';
import 'package:binance_app/features/coin_pairs/state/coin_pairs_cubit.dart';
import 'package:binance_app/features/coin_pairs/view/coin_pairs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BinanceApp extends StatefulWidget {
  const BinanceApp({super.key});

  @override
  State<BinanceApp> createState() => _BinanceAppState();
}

class _BinanceAppState extends State<BinanceApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoinPairsCubit>(create: (BuildContext context) => CoinPairsCubit()),
      ],
      child: MaterialApp(
        theme: darkTheme,
        home: const CoinPairsView(),
      ),
    );
  }
}
