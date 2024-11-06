class Item {
  final String title;
  final String description;
  final bool isFavorite;

  Item({
    required this.title,
    required this.description,
    this.isFavorite = false,
  });

  Item copyWith({String? title, String? description, bool? isFavorite}) {
    return Item(
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
