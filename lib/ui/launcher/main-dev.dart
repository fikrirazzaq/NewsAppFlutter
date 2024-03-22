import 'package:core/core.dart';
import 'package:core/network/api_constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_bloc_observer.dart';
import 'package:news_app/ui/launcher/app_config.dart';
import 'package:news_app/ui/launcher/news_app.dart';
import 'package:shared/shared.dart';

void main() async {
  Bloc.observer = NewsBlocObserver();
  // Config.appFlavor = Flavor.DEVELOPMENT;
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  Modular.bindModule(CoreModule(baseUrl: ApiConstant.baseUrlDebug, preferences: preferences));
  Modular.bindModule(SharedModule());
  runApp(
    ModularApp(
      module: AppModule(),
      child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('id', 'ID')],
        fallbackLocale: const Locale('en', 'US'),
        path: 'assets/languages',
        child: MyApp(),
      ),
    ),
  );
}
