part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;
  const factory LocationState.loaded({required Map<String, List<LocationEntity>> episode, required int? currentPage}) = _Loaded;
  const factory LocationState.loadedSearch({required Map<String, List<LocationEntity>> episode}) = _LoadedSearch;
  const factory LocationState.error(String message) = _Error;
}
