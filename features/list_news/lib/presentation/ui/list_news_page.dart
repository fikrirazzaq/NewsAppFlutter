import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_news/presentation/bloc/bloc.dart';
import 'package:shared/common/common.dart';
import 'package:shared/widget/widget.dart';

class ListNewsPage extends StatelessWidget {
  Widget _buildList() {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is HasData) {
          var articleNew = state.data[0];
          var articleList = state.data;
          articleList.removeAt(0);
          return NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                NewsHeader(article: articleNew),
              ];
            },
            body: ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 2.h),
              shrinkWrap: true,
              itemCount: articleList.length,
              itemBuilder: (context, index) {
                return CardArticle(article: articleList[index]);
              },
            ),
          );
        } else if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return Center(child: Text(state.message));
        } else if (state is NoData) {
          return Center(child: Text(state.message));
        } else if (state is NoInternetConnection) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(""));
        }
      },
    );
  }

  Widget _settingIcons() {
    return IconButton(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      onPressed: () =>
          Modular.to.pushNamed(Modular.get<NamedRoutes>().settingsPage),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Modular.get<LocaleKeys>().listNewsTitle.tr()),
        actions: [_settingIcons()],
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          transitionBetweenRoutes: false,
          middle: Text(Modular.get<LocaleKeys>().listNewsTitle.tr()),
          trailing: _settingIcons()),
      child: SafeArea(child: _buildList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Modular.get<ArticleBloc>().add(LoadData());
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
