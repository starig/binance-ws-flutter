import 'package:binance_app/config/colors.dart';
import 'package:binance_app/features/coin_pairs/components/coin_item.dart';
import 'package:binance_app/features/coin_pairs/state/coin_pairs_cubit.dart';
import 'package:binance_app/models/coin/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinPairsView extends StatefulWidget {
  const CoinPairsView({super.key});

  @override
  State<CoinPairsView> createState() => _CoinPairsViewState();
}

class _CoinPairsViewState extends State<CoinPairsView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<CoinPairsCubit>().listenStream(context.read<CoinPairsCubit>().connectWS());
    context.read<CoinPairsCubit>().searchByQuery('');
    super.initState();
  }

  @override
  void dispose() {
    context.read<CoinPairsCubit>().disconnectWS();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: BlocBuilder<CoinPairsCubit, CoinPairsState>(
          builder: (BuildContext context, state) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  titleSpacing: 0,
                  backgroundColor: Colors.transparent,
                  title: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _searchController,
                      onChanged: (String query) {
                        context.read<CoinPairsCubit>().searchByQuery(query);
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.white20,
                        ),
                        hintText: 'Search coin pairs',
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SliverList.separated(
                  itemCount: state.filteredCoins.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Coin coin = state.filteredCoins[index];
                    return CoinItem(coin: coin);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 23,
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
