import 'package:bookmark/presentation/ui/bookmark_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/common/common.dart';

class FeatureBookmarkModule extends Module {

  @override
  void routes(r) {
    r.child(Modular.get<NamedRoutes>().bookmarkPage, child: (_) => BookmarkPage());

  }}
