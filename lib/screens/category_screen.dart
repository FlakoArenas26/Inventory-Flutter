import 'package:flutter/material.dart';
import '../services/category_service.dart';
import 'components/category_list.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categorías')),
      body: FutureBuilder(
        future: _categoryService.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar las categorías'));
          } else {
            final categories = snapshot.data!;
            return CategoryList(categories: categories);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/category/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
