class Asteroid {
  final String name;
  final DateTime closeApproachDate;
  final double missDistance;
  final double diameter;
  final bool isNotentiallyHazardous;

  Asteroid({
    required this.name,
    required this.closeApproachDate,
    required this.missDistance,
    required this.diameter,
    required this.isNotentiallyHazardous,
  });

  factory Asteroid.fromJson(Map<String, dynamic> json) {
    return Asteroid(
      name: json["name"],
      closeApproachDate: DateTime.parse(json["close_approach_date"]),
      missDistance: json["miss_distance"],
      diameter: json["diameter"],
      isNotentiallyHazardous: json["is_potentially_hazardous"],
    );
  }
}