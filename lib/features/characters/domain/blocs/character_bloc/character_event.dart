part of 'character_bloc.dart';

@freezed
class CharacterEvent with _$CharacterEvent {
  const factory CharacterEvent.fetchCharacters() = FetchCharacters;
  const factory CharacterEvent.searchCharacters({required String value}) = SearchCharacters;
}
