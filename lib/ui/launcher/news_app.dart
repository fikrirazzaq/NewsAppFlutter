import 'package:bookmark/bookmark.dart';
import 'package:core/core.dart';
import 'package:core/local/shared_pref_helper.dart';
import 'package:core/network/api_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:list_news/list_news.dart';
import 'package:list_news/presentation/bloc/bloc.dart';
import 'package:news_app/ui/splash/splash_page.dart';
import 'package:settings/presentation/bloc/theme/bloc.dart';
import 'package:settings/settings.dart';
import 'package:shared/common/common.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ThemeBloc>(() => ThemeBloc(prefHelper: Modular.get<SharedPrefHelper>()));
  }

  @override
  Future<void> routes(r) async {
    r.child(Modular.get<NamedRoutes>().splashPage, child: (_) => SplashPage());
    r.module(Modular.get<NamedRoutes>().homePage, module: FeatureHomeModule());
    r.module(Modular.get<NamedRoutes>().listArticlePage, module: FeatureListNews());
    r.module(Modular.get<NamedRoutes>().bookmarkPage, module: FeatureBookmarkModule());
    r.module(Modular.get<NamedRoutes>().settingsPage, module: FeatureSettingsModule());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Modular.get<ThemeBloc>(),
        ),
        BlocProvider(
          create: (context) => Modular.get<ArticleBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    Modular.get<ThemeBloc>().add(GetTheme());
    Modular.setInitialRoute(Modular.get<NamedRoutes>().splashPage);
    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      title: Modular.get<LocaleKeys>().listNewsTitle.tr(),
      theme: state.isDarkTheme ? darkTheme : lightTheme,
      builder: (context, child) {
        return CupertinoTheme(
          data: CupertinoThemeData(brightness: state.isDarkTheme ? Brightness.dark : Brightness.light),
          child: Material(
            child: child,
          ),
        );
      },
      routeInformationProvider: Modular.routerConfig.routeInformationProvider,
      routeInformationParser: Modular.routerConfig.routeInformationParser,
      routerDelegate: Modular.routerConfig.routerDelegate,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
