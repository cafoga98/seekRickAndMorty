import 'package:dartz/dartz.dart';
import 'package:seek_rickandmorty/core/config/error_handle/failures.dart';
import 'package:seek_rickandmorty/core/config/error_handle/handle_failures.dart';
import 'package:seek_rickandmorty/features/locations/data/repositories/i_location_repository.dart';
import 'package:seek_rickandmorty/features/locations/domain/entities/location_entity.dart';
import 'package:seek_rickandmorty/features/locations/domain/entities/location_response_entity.dart';

import '../services/i_location_service.dart';

class LocationRepository implements ILocationRepository {
  final ILocationService locationService;

  LocationRepository({required this.locationService});

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocationEntityByName(String name) async {
    return await handleFailures(
          () async {
        final data = await locationService.fetchLocationByName(name);
        final locations = (data['locations']['results'] as List)
            .map((json) => LocationEntity.fromJson(json))
            .toList();
        return locations;
      },
    );
  }

  @override
  Future<Either<Failure, LocationResponse>> getLocationEntityByPage(int page) async {
    return await handleFailures(
          () async {
        final data = await locationService.fetchLocationByPage(page);
        final response = LocationResponse.fromJson(data['locations']);
        return response;
      },
    );
  }

}
