class Warehouse {
  int? id; // ID único del almacén
  String name; // Nombre del almacén
  String? address; // Dirección del almacén

  Warehouse({this.id, required this.name, this.address});

  // Convierte un objeto Warehouse a un Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'address': address};
  }

  // Crea un objeto Warehouse desde un Map
  factory Warehouse.fromMap(Map<String, dynamic> map) {
    return Warehouse(id: map['id'], name: map['name'], address: map['address']);
  }
}
