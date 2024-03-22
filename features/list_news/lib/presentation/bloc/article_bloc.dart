import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/usecases/article_usecase.dart';
import 'package:list_news/presentation/bloc/article_event.dart';
import 'package:list_news/presentation/bloc/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleUseCase articleUseCase;

  ArticleBloc({required this.articleUseCase}) : super(Initial()) {
    on<LoadData>((event, emit) async {
      try {
        emit(Loading());
        var article = await articleUseCase.getListArticle();
        if (article.isEmpty) {
          emit(NoData(message: 'No Data'));
        } else {
          emit(HasData(data: article));
        }
      } on IOException {
        emit(NoInternetConnection(message: 'No Internet Connection'));
      } on TimeoutException {
        emit(NoInternetConnection(message: 'No Internet Connection'));
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
