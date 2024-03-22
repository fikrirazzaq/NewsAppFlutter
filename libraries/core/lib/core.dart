import 'package:core/local/shared_pref_helper.dart';
import 'package:core/network/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  final String baseUrl;
  final SharedPreferences preferences;

  CoreModule({required this.baseUrl, required this.preferences});

  @override
  void binds(i) {
    i.addLazySingleton(() => preferences);
    i.addLazySingleton<SharedPrefHelper>(() => SharedPrefHelper(preferences: Modular.get<SharedPreferences>()));
    i.addLazySingleton<DioClient>(() => DioClient(apiBaseUrl: baseUrl));
  }
}