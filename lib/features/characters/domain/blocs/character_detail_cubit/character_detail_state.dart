part of 'character_detail_cubit.dart';

@freezed
class CharacterDetailState with _$CharacterDetailState {
  const factory CharacterDetailState.loadedCharacterDetail({required CharacterEntity character}) = _LoadedCharacterDetail;
  const factory CharacterDetailState.initial() = _Initial;
  const factory CharacterDetailState.loading() = _Loading;
  const factory CharacterDetailState.error({required Failure failure}) = _Error;
}
