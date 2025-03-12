class Product {
  int? id; // ID único del producto
  String name; // Nombre del producto
  String? description; // Descripción opcional
  double price; // Precio del producto
  int quantity; // Cantidad en stock
  int categoryId; // ID de la categoría (FK a Category)
  int? supplierId; // ID del proveedor (FK a Supplier)

  Product({
    this.id,
    required this.name,
    this.description,
    required this.price,
    required this.quantity,
    required this.categoryId,
    this.supplierId,
  });

  // Convierte un objeto Product a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category_id': categoryId,
      'supplier_id': supplierId,
    };
  }

  // Crea un objeto Product desde un Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      quantity: map['quantity'],
      categoryId: map['category_id'],
      supplierId: map['supplier_id'],
    );
  }
}
