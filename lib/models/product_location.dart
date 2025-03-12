class ProductLocation {
  int? id; // ID único de la ubicación
  int productId; // ID del producto (FK a Product)
  int warehouseId; // ID del almacén (FK a Warehouse)
  String location; // Ubicación específica (Ej: Estante A1)

  ProductLocation({
    this.id,
    required this.productId,
    required this.warehouseId,
    required this.location,
  });

  // Convierte un objeto ProductLocation a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'warehouse_id': warehouseId,
      'location': location,
    };
  }

  // Crea un objeto ProductLocation desde un Map
  factory ProductLocation.fromMap(Map<String, dynamic> map) {
    return ProductLocation(
      id: map['id'],
      productId: map['product_id'],
      warehouseId: map['warehouse_id'],
      location: map['location'],
    );
  }
}
