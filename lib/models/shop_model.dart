class Shop {
  final String id;
  final String name;
  final String? comment;
  final dynamic location;
  final bool is_open;
  final String createdAt;
  final String updatedAt;

  Shop({
    required this.id,
    required this.name,
    this.comment,
    required this.location,
    required this.is_open,
    required this.createdAt,
    required this.updatedAt,
  });
}
