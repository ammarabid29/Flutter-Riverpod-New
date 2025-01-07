class Item {
  final String name;
  final int id;
  final bool favorite;

  Item({
    required this.id,
    required this.name,
    required this.favorite,
  });

  Item copyWith({
    String? name,
    int? id,
    bool? favorite,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      favorite: favorite ?? this.favorite,
    );
  }
}
