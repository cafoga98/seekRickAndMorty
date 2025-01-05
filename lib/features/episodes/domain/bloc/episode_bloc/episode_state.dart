part of 'episode_bloc.dart';

@freezed
class EpisodeState with _$EpisodeState {
  const factory EpisodeState.initial() = _Initial;
  const factory EpisodeState.loading() = _Loading;
  const factory EpisodeState.loaded({required Map<String, List<EpisodeEntity>> episode, required int? currentPage}) = _Loaded;
  const factory EpisodeState.loadedSearch({required Map<String, List<EpisodeEntity>> episode}) = _LoadedSearch;
  const factory EpisodeState.error(String message) = _Error;
}
