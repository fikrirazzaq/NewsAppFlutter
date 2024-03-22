import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/presentation/ui/list_news_page.dart';
import 'package:shared/common/common.dart';

class FeatureListNews extends Module {
  @override
  void routes(r) {
    r.child(Modular.get<NamedRoutes>().listArticlePage, child: (_) => ListNewsPage());
  }
}
