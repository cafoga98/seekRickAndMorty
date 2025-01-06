import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seek_rickandmorty/features/locations/data/repositories/i_location_repository.dart';
import 'package:seek_rickandmorty/features/locations/domain/entities/location_entity.dart';

part 'location_event.dart';

part 'location_state.dart';

part 'location_bloc.freezed.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ILocationRepository locationRepository;

  LocationBloc({
    required this.locationRepository,
  }) : super(const LocationState.initial()) {
    on<FetchLocation>(_fetchCharacter);
    on<SearchLocation>(_searchCharacter);
  }

  LocationState? cacheResponse = null;

  void _fetchCharacter(FetchLocation event, Emitter<LocationState> emit) async {
    try {
      if (cacheResponse != null) {
        emit(cacheResponse!);
      } else if (state is _Loaded) {
        final currentState = state as _Loaded;
        final currentEpisodes = currentState.episode;
        final int? nextPage = currentState.currentPage;

        if (nextPage == null) {
          cacheResponse = LocationState.loaded(
            episode: currentEpisodes,
            currentPage: nextPage,
          );
        } else {
          emit(const LocationState.loading());

          await locationRepository.getLocationEntityByPage(nextPage).then(
            (response) async {
              await response.fold(
                (failure) async => emit(
                  LocationState.error(failure.message!),
                ),
                (episodeResponse) async {
                  final episodeGroup = await groupLocationByDimension(
                    locations: episodeResponse.locationEntityList,
                  );
                  final mergeMapsList =
                      await mergeMaps(currentEpisodes, episodeGroup);
                  emit(
                    LocationState.loaded(
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
        emit(const LocationState.loading());
        await locationRepository.getLocationEntityByPage(1).then(
          (response) async {
            await response.fold(
              (failure) async => emit(
                LocationState.error(failure.message!),
              ),
              (locationResponse) async {
                final locationGroup = await groupLocationByDimension(
                  locations: locationResponse.locationEntityList,
                );
                emit(
                  LocationState.loaded(
                    episode: locationGroup,
                    currentPage: locationResponse.next,
                  ),
                );
              },
            );
          },
        );
      }
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }

  void _searchCharacter(
      SearchLocation event, Emitter<LocationState> emit) async {
    emit(const LocationState.loading());
    await locationRepository.getLocationEntityByName(event.value).then(
      (response) async {
        await response.fold(
          (failure) async => emit(
            LocationState.error(failure.message!),
          ),
          (location) async {
            final locationGroup =
                await groupLocationByDimension(locations: location);
            emit(
              LocationState.loadedSearch(
                episode: locationGroup,
              ),
            );
          },
        );
      },
    );
  }

  /// Función para agrupar episodios por año
  Future<Map<String, List<LocationEntity>>> groupLocationByDimension({
    required List<LocationEntity> locations,
  }) async {
    final Map<String, List<LocationEntity>> groupedEpisodes = {};

    for (final location in locations) {
      if (!groupedEpisodes.containsKey(location.dimension)) {
        groupedEpisodes[location.dimension!] = [];
      }
      groupedEpisodes[location.dimension]!.add(location);
    }

    return groupedEpisodes;
  }

  Future<Map<String, List<LocationEntity>>> mergeMaps(
    Map<String, List<LocationEntity>> map1,
    Map<String, List<LocationEntity>> map2,
  ) async {
    final Map<String, List<LocationEntity>> mutableMap = Map.of(map1);

    map2.forEach((year, episodes) {
      if (mutableMap.containsKey(year)) {
        List<LocationEntity> newEpi = [];
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
