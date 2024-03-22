import 'package:core/local/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:settings/presentation/bloc/language/language_event.dart';
import 'package:settings/presentation/bloc/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SharedPrefHelper prefHelper;

  LanguageBloc({required this.prefHelper}) : super(InitialLanguage(isIndonesian: false)) {
    on<GetLanguage>((event, emit) async {
      var isIndonesian = await prefHelper.getValueIndonesianLanguage();
      emit(InitialLanguage(isIndonesian: isIndonesian));
    });
    on<LanguageChanged>((event, emit) async {
      await prefHelper.saveValueIndonesianLanguage(event.isIndonesian);
      if (event.isIndonesian)
        emit(EnglishLanguageState());
      else
        emit(IndonesiaLanguageState());
      emit(InitialLanguage(isIndonesian: event.isIndonesian));
    });
  }
}
