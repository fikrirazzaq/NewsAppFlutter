import 'package:core/network/dio_client.dart';
import 'package:home/presentation/ui/home_page.dart';
import 'package:list_news/data/datasources/article_remote_data_source.dart';
import 'package:list_news/data/repositories/article_repository_impl.dart';
import 'package:list_news/domain/repositories/article_repository.dart';
import 'package:list_news/domain/usecases/article_usecase.dart';
import 'package:list_news/presentation/bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:shared/common/common.dart';
class FeatureHomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ArticleDataSource>(() => ArticleApi(dio: Modular.get<DioClient>().dio));
    i.addLazySingleton<ArticleRepository>(
        () => ArticleRepositoryImpl(articleDataSource: Modular.get<ArticleDataSource>()));
    i.addLazySingleton<ArticleUseCase>(() => ArticleUseCaseImpl(articleRepository: Modular.get<ArticleRepository>()));
    i.addLazySingleton<ArticleBloc>(() => ArticleBloc(articleUseCase: Modular.get<ArticleUseCase>()));
  }

  @override
  void routes(r) {
    r.child(Modular.get<NamedRoutes>().homePage, child: (_) => HomePage());
  }
}
