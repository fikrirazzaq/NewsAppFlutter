import 'package:flutter_modular/flutter_modular.dart';
import 'package:detail_news/presentation/ui/article_web_view.dart';
import 'package:shared/common/common.dart';

import 'presentation/ui/detail_news_page.dart';

class FeatureDetailNews extends Module {
  @override
  void routes(r) {
    r.child(Modular.get<NamedRoutes>().detailArticlePage, child: (_) => DetailNewsPage(article: r.args.data));
    r.child(Modular.get<NamedRoutes>().detailWebViewPage, child: (_) => ArticleWebView(url: r.args.data));
  }
}
