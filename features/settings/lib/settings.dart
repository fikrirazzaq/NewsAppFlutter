import 'package:core/local/shared_pref_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:settings/presentation/bloc/language/bloc.dart';
import 'package:settings/presentation/ui/settings_page.dart';
import 'package:shared/common/common.dart';

class FeatureSettingsModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<LanguageBloc>(() => LanguageBloc(prefHelper: Modular.get<SharedPrefHelper>()));
  }

  @override
  void routes(r) {
    r.child(Modular.get<NamedRoutes>().settingsPage, child: (_) => SettingsPage());
  }
}
