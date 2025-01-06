import 'package:seek_rickandmorty/features/locations/domain/entities/location_entity.dart';

class LocationResponse {
  List<LocationEntity> locationEntityList;
  int? next;

  LocationResponse({
    required this.locationEntityList,
    required this.next,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return LocationResponse(
      locationEntityList: (json['results'] as List)
          .map((json) => LocationEntity.fromJson(json))
          .toList(),
      next: json['info']['next'],
    );
  }
}
