class Transaction {
  int? id; // ID único de la transacción
  String type; // Tipo de transacción (Entrada/Salida)
  DateTime date; // Fecha de la transacción
  int userId; // ID del usuario que realizó la transacción (FK a User)

  Transaction({
    this.id,
    required this.type,
    required this.date,
    required this.userId,
  });

  // Convierte un objeto Transaction a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'date': date.toIso8601String(), // Guarda la fecha como String
      'user_id': userId,
    };
  }

  // Crea un objeto Transaction desde un Map
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      type: map['type'],
      date: DateTime.parse(map['date']), // Convierte String a DateTime
      userId: map['user_id'],
    );
  }
}
