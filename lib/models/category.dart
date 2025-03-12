class Category {
  int? id; // ID único de la categoría
  String name; // Nombre de la categoría
  String? description; // Descripción opcional

  Category({this.id, required this.name, this.description});

  // Convierte un objeto Category a un Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description};
  }

  // Crea un objeto Category desde un Map
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}
