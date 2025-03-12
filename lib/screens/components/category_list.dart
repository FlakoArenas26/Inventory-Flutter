import 'package:flutter/material.dart';
import 'package:inventary/models/category.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.name),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Lógica para eliminar la categoría
            },
          ),
          onTap: () {
            Navigator.pushNamed(context, '/category/edit', arguments: category);
          },
        );
      },
    );
  }
}
