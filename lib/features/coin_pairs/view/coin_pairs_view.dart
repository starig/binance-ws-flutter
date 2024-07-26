import 'package:binance_app/config/colors.dart';
import 'package:binance_app/config/helpers.dart';
import 'package:binance_app/features/coin_pairs/state/coin_pairs_cubit.dart';
import 'package:binance_app/gen/fonts.gen.dart';
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
                    final double currentVal = double.parse(coin.data.c);
                    final double prevVal = double.parse(coin.data.o);
                    final Color primaryCoinColor =
                        currentVal < prevVal ? AppColors.primaryRed : AppColors.primaryGreen;
                    double percentageChange = ((currentVal - prevVal) / prevVal) * 100;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      coin.data.s.substring(0, 3),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        fontFamily: FontFamily.titilliumWeb,
                                      ),
                                    ),
                                    Text(
                                      '/${coin.data.s.substring(3)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: FontFamily.titilliumWeb,
                                        color: AppColors.white40,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Vol ${convertNumberToMillionFormat(double.parse(coin.data.q))}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 33,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coin.data.c.substring(0, 7),
                                  style: TextStyle(
                                    color: primaryCoinColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '${coin.data.c.substring(0, 7)} \$',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 103,
                          padding: const EdgeInsets.symmetric(
                            // horizontal: 22,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: primaryCoinColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              "${percentageChange >= 0 ? '+' : ''}${percentageChange.toStringAsFixed(2)}%",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
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
