// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_flutter_task/blocs/appbloc/cubit/app_cubit.dart';
import 'package:gweiland_flutter_task/blocs/cryptocurrency_listing/bloc/cryptocurrency_bloc.dart';
import 'package:gweiland_flutter_task/utils/common_exports.dart';
import 'package:gweiland_flutter_task/widgets/crypto_currency_list_item.dart';
import 'package:gweiland_flutter_task/widgets/dashboard_card_graph.dart';
import 'package:gweiland_flutter_task/widgets/outline_button.dart';
import 'package:gweiland_flutter_task/widgets/outline_textfield.dart';
import 'package:gweiland_flutter_task/widgets/primary_btn.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExchangeTab<T extends AppCubit> extends StatefulWidget {
  const ExchangeTab({super.key});

  @override
  State<ExchangeTab> createState() => _ExchangeTabState();
}

class _ExchangeTabState extends State<ExchangeTab> {
  final TextEditingController _cryptoSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CryptocurrencyBloc>(context)
        .add(const InitialEvent(start: 1, limit: 20, convertInto: 'USD'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(left: 6),
          child: Text(
            AppStrings.exchange,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppConstants.darkAccent),
          ),
        ),
        centerTitle: false,
        actions: [
          Center(
            child: Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  AppImages.bellIcon,
                  height: 20,
                  width: 19,
                ),
                const Positioned(
                  right: -5,
                  top: -5,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: AppConstants.yellow,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SvgPicture.asset(
            AppImages.settingsIcon,
            height: 20,
            width: 19,
            // fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 32.35,
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26),
      child: Column(
        children: [
          _searchField(),
          const SizedBox(
            height: 22,
          ),
          _title(),
          const SizedBox(
            height: 15,
          ),
          _dashCard(),
          const SizedBox(
            height: 19.5,
          ),
          _topCryptoCurrenciesTitle(),
          const SizedBox(
            height: 16,
          ),
          _cryptoList(),
        ],
      ),
    );
  }

  Widget _searchField() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: OutlineTextField(
              hintText: AppStrings.searchCryptoLable,
              controller: _cryptoSearchController,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(11.0),
                child: SvgPicture.asset(
                  AppImages.searchIcon,
                  height: 12,
                  width: 12,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 9,
        ),
    
             RoundedOutlineButton(
                onPressed: () async {
                  final filterList = ['Price', 'Volume_24h'];
                  // BlocProvider.of<AppCubit>(context).applyFiler(0);
                  await _filterBootmSheet(filterList);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.filterIcon,
                      height: 9,

                      width: 11.16,
                      // fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      AppStrings.filter,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppConstants.lightgrey.withOpacity(0.3)),
                    )
                  ],
                ))              
      ],
    );
  }

  Widget _title() {
    return Row(
      children: [
        const Text(
          AppStrings.cryptocurrency,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppConstants.darkAccent),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          AppStrings.nft,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppConstants.lightgrey.withOpacity(0.3)),
        ),
      ],
    );
  }

  Widget _dashCard() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 131,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppConstants.green.withOpacity(0.1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _topCard(),
                const DashBOardCardGraph(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _topCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 26, right: 20),
      child: Row(
        children: [
          SvgPicture.asset(
            AppImages.bitCoinLogo,
            height: 46.48,
            width: 46.48,
            // fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 14.52,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.btc,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppConstants.darkAccent),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  AppStrings.bitcoin,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppConstants.darkAccent),
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppStrings.sampleAmt,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppConstants.darkAccent),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                AppStrings.sampleGrowth,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppConstants.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _topCryptoCurrenciesTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          AppStrings.topCryptoCurrencies,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppConstants.darkAccent),
        ),
        Text(
          AppStrings.viewAll,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppConstants.lightgrey.withOpacity(0.3)),
        ),
      ],
    );
  }

  Widget _cryptoList() {
    return BlocBuilder<CryptocurrencyBloc, CryptocurrencyState>(
      builder: (_, state) {
        if (state is CryptocurrencyLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is CryptocurrencyError) {
          return Center(
            child: Text(state.error.toString()),
          );
        } else if (state is CryptocurrencyLoaded) {
          final cryptoList = state.cryptoCurrencyListingModel.data ?? [];
          return Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              controller: BlocProvider.of<CryptocurrencyBloc>(context)
                  .refreshController,
              onRefresh: () async {
                try {
                  await Future.delayed(const Duration(milliseconds: 1000));
                  BlocProvider.of<CryptocurrencyBloc>(context).add(
                      const InitialEvent(
                          start: 1, limit: 20, convertInto: 'USD'));
                  BlocProvider.of<CryptocurrencyBloc>(context)
                      .refreshController
                      .refreshCompleted();
                  BlocProvider.of<AppCubit>(context).applyFiler(0);
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: ListView.builder(
                  itemCount: cryptoList.length,
                  itemBuilder: (context, int index) {
                    return CryptoCurrencyCard(
                      cryptoListItem: cryptoList[index],
                      index: index,
                    );
                  }),
            ),
          );
        } else {
          return Text(state.toString());
        }
      },
    );
  }

  List typeSubList = [
    {
      'type_name': 'By',
      'filter_list': ['Price', 'Volume_24h'],
      'selected_option': 0
    }
  ];
  _filterBootmSheet(List<String> filterList) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize: 0.3,
        maxChildSize: 0.75,
        expand: false,
        builder: (_, controller) => BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          listenWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Icon(CupertinoIcons.minus),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      const Text(
                        AppStrings.filter,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const SizedBox(
                            height: 24,
                            width: 24,
                            child: Icon(
                              Icons.close,
                              color: AppConstants.darkAccent,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                          child: Text(
                        'By',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (state is AppInitial)
                            for (int i = 0; i < filterList.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    final c = i + 1;
                                    BlocProvider.of<AppCubit>(context)
                                        .applyFiler(c);
                                    // asd
                                  },
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:
                                            state.appmodel.homeFilter == i + 1
                                                ? AppConstants.green
                                                    .withOpacity(0.6)
                                                : Colors.transparent,
                                        border: Border.all(
                                            color: AppConstants.lightgrey)),
                                    child: Center(
                                      child: Text(
                                        filterList[i],
                                        style: TextStyle(
                                            color: state.appmodel.homeFilter ==
                                                    i + 1
                                                ? Colors.white
                                                : null),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                        ],
                      ))
                    ],
                  ),
                )),
                Divider(
                  color: AppConstants.grey,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: GradientPrimaryButton(
                          buttonColor: AppConstants.darkAccent,
                          text: AppStrings.reset,
                          onPressed: () {
                            BlocProvider.of<AppCubit>(context).applyFiler(0);
                            BlocProvider.of<CryptocurrencyBloc>(context).add(
                                const InitialEvent(
                                    start: 1, limit: 20, convertInto: 'USD'));
                            Navigator.pop(context, 0);
                          },
                          textColor: AppConstants.darkAccent,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GradientPrimaryButton(
                            textColor: Colors.black,
                            text: AppStrings.apply,
                            onPressed: () {
                              if (state is AppInitial) {
                                if (state.appmodel.homeFilter == 1) {
                                  BlocProvider.of<CryptocurrencyBloc>(context)
                                      .add(const FilterEventByPrice(
                                          filterNo: 1));
                                } else if (state.appmodel.homeFilter == 0) {
                                  BlocProvider.of<CryptocurrencyBloc>(context)
                                      .add(const FilterEventByPrice(
                                          filterNo: 2));
                                }
                                Navigator.pop(
                                    context, state.appmodel.homeFilter);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
