import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/common/common.dart';

class SharedModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ImageAssets>(() => ImageAssets());
    i.addLazySingleton<LocaleKeys>(() => LocaleKeys());
    i.addLazySingleton<NamedRoutes>(() => NamedRoutes());
    i.addLazySingleton<ColorPalettes>(() => ColorPalettes());
  }
}
