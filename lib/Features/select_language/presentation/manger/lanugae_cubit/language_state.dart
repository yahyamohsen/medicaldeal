part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageUpdated extends LanguageState {
  final Locale locale;

  LanguageUpdated(this.locale);
}
