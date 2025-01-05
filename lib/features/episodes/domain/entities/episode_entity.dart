class EpisodeEntity {
  final String id;
  final String name;
  final String airDate;

  EpisodeEntity({
    required this.id,
    required this.name,
    required this.airDate,
  });

  factory EpisodeEntity.fromJson(Map<String, dynamic> json) {
    return EpisodeEntity(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
    );
  }
}
