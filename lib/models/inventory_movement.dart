class InventoryMovement {
  int? id; // ID único del movimiento
  int transactionId; // ID de la transacción (FK a Transaction)
  int productId; // ID del producto (FK a Product)
  int quantity; // Cantidad movida
  double unitPrice; // Precio unitario del producto

  InventoryMovement({
    this.id,
    required this.transactionId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
  });

  // Convierte un objeto InventoryMovement a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transaction_id': transactionId,
      'product_id': productId,
      'quantity': quantity,
      'unit_price': unitPrice,
    };
  }

  // Crea un objeto InventoryMovement desde un Map
  factory InventoryMovement.fromMap(Map<String, dynamic> map) {
    return InventoryMovement(
      id: map['id'],
      transactionId: map['transaction_id'],
      productId: map['product_id'],
      quantity: map['quantity'],
      unitPrice: map['unit_price'],
    );
  }
}
