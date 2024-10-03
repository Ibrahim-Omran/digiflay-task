
class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
    );
  }
}

class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final CategoryModel category;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: CategoryModel.fromJson(jsonData['category']),
      images: List<String>.from(jsonData['images']),
    );
  }
}

class GetAllProductsModel {
  final List<ProductModel> products;

  GetAllProductsModel({required this.products});

  factory GetAllProductsModel.fromJson(List<dynamic> jsonData) {
    return GetAllProductsModel(
      products: jsonData.map<ProductModel>((item) => ProductModel.fromJson(item)).toList(),
    );
  }
}
