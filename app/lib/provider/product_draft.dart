import 'package:sqflite/sqflite.dart';
import 'dart:io';
import '../domain/product.dart';
import 'package:path_provider/path_provider.dart';

class ProductDraftProvider{

  Future<Database> database;

  ProductDraftProvider(this.database);

  Future<void> insertProduct(Product product, List<File> images) async {
    final db = await database;

    // Créer un dossier pour stocker les images
    final directory = await getApplicationDocumentsDirectory();
    final imageDirectory = Directory('${directory.path}/images');
    if (!imageDirectory.existsSync()) {
      imageDirectory.createSync();
    }

    // Enregistrer les images et obtenir les chemins d'accès
    List<String> imagePaths = [];
    for (var image in images) {
      final imageName = '${DateTime.now().millisecondsSinceEpoch}.png';
      final newImage = await image.copy('${imageDirectory.path}/$imageName');
      imagePaths.add(newImage.path);
    }

    // Créer un nouveau produit avec les chemins d'accès des images
    Product newProduct = Product(
      id: product.id,
      pictureList: imagePaths,
      title: product.title,
      prix: product.prix,
      categoryId: product.categoryId,
      description: product.description,
      city: product.city,
      postCode: product.postCode,
      userId: product.userId,
    );

    await db.insert(
      'products',
      newProduct.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Product>> products() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        pictureList: (maps[i]['pictureList'] as String).split(', '),
        title: maps[i]['title'],
        prix: maps[i]['prix'],
        categoryId: maps[i]['categoryId'],
        description: maps[i]['description'],
        city: maps[i]['city'],
        postCode: maps[i]['postCode'],
        userId: maps[i]['userId'],
      );
    });
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;

    await db.update(
      'products',
      product.toMap(),
      where: "id = ?",
      whereArgs: [product.id],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;

    await db.delete(
      'products',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<Product>> getProductsByUserId(int userId) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'products',
      where: "userId = ?",
      whereArgs: [userId],
    );

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        pictureList: (maps[i]['pictureList'] as String).split(', '),
        title: maps[i]['title'],
        prix: maps[i]['prix'],
        categoryId: maps[i]['categoryId'],
        description: maps[i]['description'],
        city: maps[i]['city'],
        postCode: maps[i]['postCode'],
        userId: maps[i]['userId'],
      );
    });
  }


}