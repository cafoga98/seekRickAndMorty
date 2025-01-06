import 'package:dartz/dartz.dart';
import 'package:seek_rickandmorty/core/config/error_handle/failures.dart';
import 'package:seek_rickandmorty/features/locations/domain/entities/location_entity.dart';
import 'package:seek_rickandmorty/features/locations/domain/entities/location_response_entity.dart';

abstract class ILocationRepository {
  /// Obtiene los personajes paginados como modelos
  Future<Either<Failure, LocationResponse>> getLocationEntityByPage(int page);

  /// Busca personajes por nombre como modelos
  Future<Either<Failure, List<LocationEntity>>> getLocationEntityByName(String name);

}
