class User {
  int? id; // ID único del usuario
  String name; // Nombre del usuario
  String email; // Correo electrónico
  String password; // Contraseña
  int roleId; // ID del rol (FK a Role)

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.roleId,
  });

  // Convierte un objeto User a un Map (para la base de datos)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role_id': roleId,
    };
  }

  // Crea un objeto User desde un Map (desde la base de datos)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      roleId: map['role_id'],
    );
  }
}
