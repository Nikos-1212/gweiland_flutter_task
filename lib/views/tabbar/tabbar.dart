// ignore_for_file: deprecated_member_use

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_flutter_task/blocs/appbloc/cubit/app_cubit.dart';
import 'package:gweiland_flutter_task/utils/common_exports.dart';
import 'package:gweiland_flutter_task/views/tabbar/e_shope.dart';
import 'package:gweiland_flutter_task/views/tabbar/exchange.dart';
import 'package:gweiland_flutter_task/views/tabbar/launchpad.dart';
import 'package:gweiland_flutter_task/views/tabbar/wallet.dart';
import 'package:gweiland_flutter_task/views/tabbar/world.dart';
import 'package:gweiland_flutter_task/widgets/colored_status_bar.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  final AppCubit appCubit = AppCubit();

  // Define the screens corresponding to each tab
  final List<Widget> _screens = [
    const EshopeTab(),
    const ExchangeTab(),
    const WorldTab(),
    const LaunchpadTab(),
    const WalletTab()
  ];
  @override
  Widget build(BuildContext context) {
    return VGColoredStatusBar(
      color: Colors.white,
      brightness: Brightness.light,
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AppInitial) {
              return Scaffold(
                body: _screens[state.appmodel.appTab!],
                bottomNavigationBar: Padding(
                  padding:
                      const EdgeInsets.only(left: 13, right: 13, bottom: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppConstants.darkAccent,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 9, bottom: 8),
                    child: SizedBox(
                      height: 54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildTabItem(
                              0,
                              state.appmodel.appTab!,
                              AppImages.eshopeTab,
                              AppStrings.eShope,
                              19,
                              19,
                              context),
                          _buildTabItem(
                              1,
                              state.appmodel.appTab!,
                              AppImages.exchangeTab,
                              AppStrings.exchange,
                              20,
                              19.97,
                              context),
                          _buildMiddleTab(),
                          _buildTabItem(
                              3,
                              state.appmodel.appTab!,
                              AppImages.launchpadTab,
                              AppStrings.launchPad,
                              18.17,
                              19,
                              context),
                          _buildTabItem(
                              4,
                              state.appmodel.appTab!,
                              AppImages.walletTab,
                              AppStrings.wallet,
                              18.17,
                              19,
                              context),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _buildMiddleTab() {
    return GestureDetector(
      onTap: () {
        // Handle the middle tab tap action if needed
      },
      child: Container(
        height: 54,
        width: 53.36,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppConstants.darkBG, // Set the background color as needed
        ),
        child: SvgPicture.asset(
          AppImages.worldTab,
          height: 54,
          width: 53.36,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, int selectedIndex, String imagePath,
      String label, double height, double width, BuildContext contexts) {
    return GestureDetector(
      onTap: () {
        try {
          BlocProvider.of<AppCubit>(contexts).updateTabs(index);
        } catch (e) {
          // print(e.toString());
        }
        // Handle the middle tab tap action if needed
      },
      child: Container(
        height: 54,
        alignment: Alignment.center,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              height: height,
              width: width,
              fit: BoxFit.cover,
              color: index == selectedIndex
                  ? Colors.white
                  : AppConstants.lightAccent.withOpacity(0.4),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              label,
              style: TextStyle(
                  fontSize: 10,
                  color: index == selectedIndex
                      ? Colors.white
                      : AppConstants.lightAccent.withOpacity(0.4)),
            )
          ],
        ),
      ),
    );
  }
}
