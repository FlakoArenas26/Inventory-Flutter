class Role {
  int? id; // ID único del rol
  String name; // Nombre del rol (Ej: Admin, Empleado)

  Role({this.id, required this.name});

  // Convierte un objeto Role a un Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  // Crea un objeto Role desde un Map
  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(id: map['id'], name: map['name']);
  }
}
