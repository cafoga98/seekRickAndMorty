class LocationEntity {
  final String name;
  final String type;
  final String dimension;

  LocationEntity({
    required this.name,
    required this.type,
    required this.dimension,
  });

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
    );
  }
}
