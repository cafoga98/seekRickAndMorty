import 'package:seek_rickandmorty/features/episodes/domain/entities/episode_entity.dart';
import 'package:seek_rickandmorty/features/locations/domain/entities/location_entity.dart';

class CharacterEntity {
  final String id;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final String? image;
  final LocationEntity? location;
  final List<EpisodeEntity>? episodes;
  final String? originName;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    this.location,
    this.episodes,
    this.originName,
  });

  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    return CharacterEntity(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
    );
  }

  factory CharacterEntity.fromJsonDetail(Map<String, dynamic> json) {
    return CharacterEntity(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
      location: json['location'] != null
          ? LocationEntity.fromJson(json['location'])
          : null,
      episodes: json['episode'] != null
          ? (json['episode'] as List)
          .map((value) => EpisodeEntity.fromJson(value))
          .toList()
          : null,
      originName: json['origin']['name'],
    );
  }
}
