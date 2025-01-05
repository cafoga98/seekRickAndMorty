part of 'episode_bloc.dart';

@freezed
class EpisodeEvent with _$EpisodeEvent {
  const factory EpisodeEvent.fetchEpisodes() = FetchEpisodes;
  const factory EpisodeEvent.searchEpisode({required String value}) = SearchEpisode;
}
