part of 'character_bloc.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = _Initial;
  const factory CharacterState.loading() = _Loading;
  const factory CharacterState.loaded({required List<CharacterEntity> characters, required int currentPage}) = _Loaded;
  const factory CharacterState.loadedSearch({required List<CharacterEntity> characters, required int currentPage}) = _LoadedSearch;
  const factory CharacterState.error(String message) = _Error;
}
