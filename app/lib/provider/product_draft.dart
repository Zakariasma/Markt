import 'package:sqflite/sqflite.dart';
import 'dart:io';
import '../domain/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../domain/productDTO.dart';


class ProductDraftProvider{

  Future<Database> get database async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'products.db');

    if (await databaseExists(dbPath)) {
      return openDatabase(dbPath);
    } else {
      return openDatabase(
        dbPath,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE products(id INTEGER PRIMARY KEY, pictureList TEXT, title TEXT, prix TEXT, categoryId INTEGER, description TEXT, city TEXT, postCode TEXT, userId INTEGER)",
          );
        },
        version: 1,
      );
    }
  }


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
      id: DateTime.now().millisecondsSinceEpoch,
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

  Future<void> updateProduct(Product product, List<File> images) async {
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

    // Mettre à jour le produit avec les nouveaux chemins d'accès des images
    Product updatedProduct = Product(
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

    await db.update(
      'products',
      updatedProduct.toMap(),
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

  Future<List<ProductDTO>> getProductsByUserId(int userId) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'products',
      where: "userId = ?",
      whereArgs: [userId],
    );

    List.generate(maps.length, (i) {
      Product(
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

    List<ProductDTO> products = [];
    for (var item in maps) {
      products.add(mapProductToProductDTO(Product(
        id: item['id'],
        pictureList: (item['pictureList'] as String).split(', '),
        title: item['title'],
        prix: item['prix'],
        categoryId: item['categoryId'],
        description: item['description'],
        city: item['city'],
        postCode: item['postCode'],
        userId: item['userId'],
      )));
    }
    return products;
  }


  mapProductToProductDTO(Product product){
    return ProductDTO(
      id: product.id,
      pictureList: product.pictureList,
      title: product.title,
      prix: int.parse(product.prix),
      category: product.categoryId.toString(),
      description: product.description,
      city: product.city,
      postCode: product.postCode,
      username: product.userId.toString(),
      date: '',
      profilPicture: '',
    );
  }


}