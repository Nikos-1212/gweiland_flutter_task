import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_flutter_task/blocs/appbloc/cubit/app_cubit.dart';
import 'package:gweiland_flutter_task/blocs/cryptocurrency_listing/bloc/cryptocurrency_bloc.dart';
import 'package:gweiland_flutter_task/utils/common_exports.dart';
import 'package:gweiland_flutter_task/views/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(module: MyModule(), child: const MyApp()));
}

class MyModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Bind.singleton<UILib>((i) => UILibImplementation()),
      ];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute(Modular.initialRoute,
        //         child: (context, args) => const Login()),
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const Tabbar()),
        ChildRoute(AppRoutes.homeRoutes,
            child: (context, args) => const HomePage()),
      ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
        BlocProvider<CryptocurrencyBloc>(
            create: (BuildContext context) => CryptocurrencyBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppConstants.lightTheme,
        routes: {
          "/tabbar": (context) => const Tabbar(),
        },
        home: const Tabbar(),
      ),
    );
  }
}
