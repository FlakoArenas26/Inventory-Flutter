import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'inventario.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Tabla de Usuarios
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT,
        role_id INTEGER
      )
    ''');

    // Tabla de Roles
    await db.execute('''
      CREATE TABLE roles(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');

    // Tabla de Categorías
    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT
      )
    ''');

    // Tabla de Productos
    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        price REAL,
        quantity INTEGER,
        category_id INTEGER,
        supplier_id INTEGER
      )
    ''');

    // Tabla de Proveedores
    await db.execute('''
      CREATE TABLE suppliers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        address TEXT,
        phone TEXT,
        email TEXT
      )
    ''');

    // Tabla de Transacciones
    await db.execute('''
      CREATE TABLE transactions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        date TEXT,
        user_id INTEGER
      )
    ''');

    // Tabla de Movimientos de Inventario
    await db.execute('''
      CREATE TABLE inventory_movements(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transaction_id INTEGER,
        product_id INTEGER,
        quantity INTEGER,
        unit_price REAL
      )
    ''');

    // Tabla de Almacenes
    await db.execute('''
      CREATE TABLE warehouses(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        address TEXT
      )
    ''');

    // Tabla de Ubicaciones de Productos
    await db.execute('''
      CREATE TABLE product_locations(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        product_id INTEGER,
        warehouse_id INTEGER,
        location TEXT
      )
    ''');

    // Tabla de Auditoría
    await db.execute('''
      CREATE TABLE audits(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        user_id INTEGER,
        description TEXT
      )
    ''');
  }

  // Métodos para Usuarios
  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await database;
    return await db.query('users');
  }

  // Métodos para Roles
  Future<int> insertRole(Map<String, dynamic> role) async {
    Database db = await database;
    return await db.insert('roles', role);
  }

  // Métodos para Categorías
  Future<int> insertCategory(Map<String, dynamic> category) async {
    Database db = await database;
    return await db.insert('categories', category);
  }

  // Métodos para Productos
  Future<int> insertProduct(Map<String, dynamic> product) async {
    Database db = await database;
    return await db.insert('products', product);
  }

  // Métodos para Proveedores
  Future<int> insertSupplier(Map<String, dynamic> supplier) async {
    Database db = await database;
    return await db.insert('suppliers', supplier);
  }

  // Métodos para Transacciones
  Future<int> insertTransaction(Map<String, dynamic> transaction) async {
    Database db = await database;
    return await db.insert('transactions', transaction);
  }

  // Métodos para Movimientos de Inventario
  Future<int> insertInventoryMovement(Map<String, dynamic> movement) async {
    Database db = await database;
    return await db.insert('inventory_movements', movement);
  }

  // Métodos para Almacenes
  Future<int> insertWarehouse(Map<String, dynamic> warehouse) async {
    Database db = await database;
    return await db.insert('warehouses', warehouse);
  }

  // Métodos para Ubicaciones de Productos
  Future<int> insertProductLocation(Map<String, dynamic> location) async {
    Database db = await database;
    return await db.insert('product_locations', location);
  }

  // Métodos para Auditoría
  Future<int> insertAudit(Map<String, dynamic> audit) async {
    Database db = await database;
    return await db.insert('audits', audit);
  }
}
