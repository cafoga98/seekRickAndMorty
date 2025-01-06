part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.fetchLocation() = FetchLocation;
  const factory LocationEvent.searchLocation({required String value}) = SearchLocation;
}
