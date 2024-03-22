import 'package:core/local/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:settings/presentation/bloc/theme/bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPrefHelper prefHelper;

  ThemeBloc({required this.prefHelper}) : super(ThemeState(isDarkTheme: false)) {
    on<GetTheme>((event, emit) async {
      var isDarkTheme = await prefHelper.getValueDarkTheme();
      emit(ThemeState(isDarkTheme: isDarkTheme));
    });

    on<ThemeChanged>((event, emit) async {
      await prefHelper.saveValueDarkTheme(event.isDarkTheme);
      emit(ThemeState(isDarkTheme: event.isDarkTheme));
    });
  }
}
