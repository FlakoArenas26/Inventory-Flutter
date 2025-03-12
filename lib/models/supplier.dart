class Supplier {
  int? id; // ID único del proveedor
  String name; // Nombre del proveedor
  String? address; // Dirección del proveedor
  String? phone; // Teléfono del proveedor
  String? email; // Correo electrónico del proveedor

  Supplier({this.id, required this.name, this.address, this.phone, this.email});

  // Convierte un objeto Supplier a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
    };
  }

  // Crea un objeto Supplier desde un Map
  factory Supplier.fromMap(Map<String, dynamic> map) {
    return Supplier(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      phone: map['phone'],
      email: map['email'],
    );
  }
}
