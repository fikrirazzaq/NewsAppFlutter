import 'package:flutter/material.dart';
import 'package:list_news/data/datasources/article_remote_data_source.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:list_news/domain/repositories/article_repository.dart';

import '../models/article_result_model.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleDataSource articleDataSource;

  ArticleRepositoryImpl({required this.articleDataSource});

  @override
  Future<List<ArticleEntity>> getListArticle() async {
    ArticleResultModel? article = await articleDataSource.getListArticle();
    return article?.articles
            .map((e) => ArticleEntity(
                  author: e.author ?? '',
                  title: e.title ?? '',
                  description: e.description ?? '',
                  url: e.url ?? '',
                  urlToImage: e.urlToImage ?? '',
                  publishedAt: e.publishedAt ?? '',
                  content: e.content ?? '',
                ))
            .toList() ??
        [];
  }
}
