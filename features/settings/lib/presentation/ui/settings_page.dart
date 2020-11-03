import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/presentation/bloc/language/bloc.dart';
import 'package:settings/presentation/bloc/theme/bloc.dart';
import 'package:shared/common/common.dart';
import 'package:shared/widget/widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Modular.get<LocaleKeys>().settingTitle.tr()),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        middle: Text(Modular.get<LocaleKeys>().settingTitle.tr()),
      ),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    Modular.get<LanguageBloc>().add(GetLanguage());
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text(Modular.get<LocaleKeys>().settingTheme.tr()),
            trailing: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch.adaptive(
                  value: state is ThemeState ? state.isDarkTheme : false,
                  onChanged: (value) {
                    Modular.get<ThemeBloc>()
                        .add(ThemeChanged(isDarkTheme: value));
                  },
                );
              },
            ),
          ),
        ),
        BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {
            if (state is EnglishLanguageState) {
              context.locale = context.supportedLocales[1];
              SmoothDialog(
                context: context,
                path: Modular.get<ImageAssets>().successful,
                mode: SmoothMode.Lottie,
                content: "Aplikasi Anda sekarang menggunakan Bahasa Indonesia",
                title: "Ganti Bahasa Berhasil!",
                submit: () {
                  Modular.to.pushNamedAndRemoveUntil(
                      Modular.get<NamedRoutes>().homePage,
                      (Route<dynamic> route) => false);
                },
                cancel: () {
                  Modular.to.pushNamedAndRemoveUntil(
                      Modular.get<NamedRoutes>().homePage,
                      (Route<dynamic> route) => false);
                },
              );
            } else if (state is IndonesiaLanguageState) {
              context.locale = context.supportedLocales[0];
              SmoothDialog(
                context: context,
                path: Modular.get<ImageAssets>().successful,
                mode: SmoothMode.Lottie,
                content: "Your Apps now using English Language",
                title: "Change Language Successful!",
                submit: () {
                  Modular.to.pushNamedAndRemoveUntil(
                      Modular.get<NamedRoutes>().homePage,
                      (Route<dynamic> route) => false);
                },
                cancel: () {
                  Modular.to.pushNamedAndRemoveUntil(
                      Modular.get<NamedRoutes>().homePage,
                      (Route<dynamic> route) => false);
                },
              );
            }
          },
          child: Material(
            child: ListTile(
              title: Text(Modular.get<LocaleKeys>().settingLanguage.tr()),
              trailing: BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  return Switch.adaptive(
                    value:
                        state is InitialLanguage ? state.isIndonesian : false,
                    onChanged: (value) {
                      setState(() {
                        Modular.get<LanguageBloc>()
                            .add(LanguageChanged(isIndonesian: value));
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<LanguageBloc>(),
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }
}
