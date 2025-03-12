class Audit {
  int? id; // ID único de la auditoría
  DateTime date; // Fecha de la auditoría
  int userId; // ID del usuario que realizó la auditoría (FK a User)
  String description; // Descripción de la auditoría

  Audit({
    this.id,
    required this.date,
    required this.userId,
    required this.description,
  });

  // Convierte un objeto Audit a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(), // Guarda la fecha como String
      'user_id': userId,
      'description': description,
    };
  }

  // Crea un objeto Audit desde un Map
  factory Audit.fromMap(Map<String, dynamic> map) {
    return Audit(
      id: map['id'],
      date: DateTime.parse(map['date']), // Convierte String a DateTime
      userId: map['user_id'],
      description: map['description'],
    );
  }
}
