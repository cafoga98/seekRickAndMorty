import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seek_rickandmorty/features/episodes/data/repositories/i_episode_repository.dart';
import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_entity.dart';

part 'episode_event.dart';

part 'episode_state.dart';

part 'episode_bloc.freezed.dart';

Map<String, List<EpisodeEntity>> cacheList = {};

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final IEpisodeRepository episodeRepository;

  EpisodeBloc({
    required this.episodeRepository,
  }) : super(const EpisodeState.initial()) {
    on<FetchEpisodes>(_fetchCharacter);
    on<SearchEpisode>(_searchCharacter);
  }

  EpisodeState? cacheResponse = null;

  void _fetchCharacter(FetchEpisodes event, Emitter<EpisodeState> emit) async {
    try {
      if (cacheResponse != null) {
        emit(cacheResponse!);
      } else if (state is _Loaded) {
        final currentState = state as _Loaded;
        final currentEpisodes = currentState.episode;
        final int? nextPage = currentState.currentPage;

        if (nextPage == null) {
          cacheResponse = EpisodeState.loaded(
            episode: currentEpisodes,
            currentPage: nextPage,
          );
        } else {
          emit(const EpisodeState.loading());

          await episodeRepository.getEpisodeEntityByPage(nextPage!).then(
            (response) async {
              await response.fold(
                (failure) async => emit(
                  EpisodeState.error(failure.message!),
                ),
                (episodeResponse) async {
                  final episodeGroup = await groupEpisodesByYear(
                      episodes: episodeResponse.episodeEntityList);
                  final mergeMapsList =
                      await mergeMaps(currentEpisodes, episodeGroup);
                  emit(
                    EpisodeState.loaded(
                      episode: mergeMapsList,
                      currentPage: episodeResponse.next,
                    ),
                  );
                },
              );
            },
          );
        }
      } else {
        emit(const EpisodeState.loading());
        await episodeRepository.getEpisodeEntityByPage(1).then(
          (response) async {
            await response.fold(
              (failure) async => emit(
                EpisodeState.error(failure.message!),
              ),
              (episodeResponse) async {
                final episodeGroup = await groupEpisodesByYear(
                  episodes: episodeResponse.episodeEntityList,
                );
                emit(
                  EpisodeState.loaded(
                    episode: episodeGroup,
                    currentPage: episodeResponse.next,
                  ),
                );
              },
            );
          },
        );
      }
    } catch (e) {
      emit(EpisodeState.error(e.toString()));
    }
  }

  void _searchCharacter(SearchEpisode event, Emitter<EpisodeState> emit) async {
    emit(const EpisodeState.loading());
    await episodeRepository.getEpisodeEntityByName(event.value).then(
      (response) async {
        await response.fold(
          (failure) async => emit(
            EpisodeState.error(failure.message!),
          ),
          (episode) async {
            final episodeGroup = await groupEpisodesByYear(episodes: episode);
            emit(
              EpisodeState.loadedSearch(
                episode: episodeGroup,
              ),
            );
          },
        );
      },
    );
  }

  /// Función para agrupar episodios por año
  Future<Map<String, List<EpisodeEntity>>> groupEpisodesByYear({
    required List<EpisodeEntity> episodes,
  }) async {
    final Map<String, List<EpisodeEntity>> groupedEpisodes = {};

    for (final episode in episodes) {
      final String year = extractYearFromAirDate(episode.airDate!);

      if (!groupedEpisodes.containsKey(year)) {
        groupedEpisodes[year] = [];
      }
      groupedEpisodes[year]!.add(episode);
    }

    return groupedEpisodes;
  }

  /// Función para extraer el año de la fecha
  String extractYearFromAirDate(String airDate) {
    final List<String> parts = airDate.split(' ');
    return parts.last;
  }

  Future<Map<String, List<EpisodeEntity>>> mergeMaps(
    Map<String, List<EpisodeEntity>> map1,
    Map<String, List<EpisodeEntity>> map2,
  ) async {
    final Map<String, List<EpisodeEntity>> mutableMap = Map.of(map1);

    map2.forEach((year, episodes) {
      if (mutableMap.containsKey(year)) {
        List<EpisodeEntity> newEpi = [];
        newEpi.addAll(mutableMap[year]!);
        newEpi.addAll(episodes);
        mutableMap[year] = newEpi;
      } else {
        mutableMap[year] = episodes;
      }
    });

    return mutableMap;
  }
}
