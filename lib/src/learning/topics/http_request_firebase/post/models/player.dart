class Player {
  final String id;
  String name;
  String position;
  String imageUrl;
  final DateTime createdAt;

  Player({
    required this.id,
    required this.name,
    required this.position,
    required this.imageUrl,
    required this.createdAt,
  });
}
