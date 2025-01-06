import 'package:seek_rickandmorty/features/characters/domain/entities/character_entity.dart';

class EpisodeEntity {
  final String? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<CharacterEntity>? characters;

  EpisodeEntity({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
  });

  factory EpisodeEntity.fromJson(Map<String, dynamic> json) {
    return EpisodeEntity(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
      characters: json['characters'] != null
          ? (json['characters'] as List)
              .map((character) => CharacterEntity.fromJson(character))
              .toList()
          : null,
    );
  }
}
