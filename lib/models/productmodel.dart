class ProductModel {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ProductModel({this.products, this.total, this.skip, this.limit});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      List<dynamic> productsList = json['products'];
      List<Products> products =
      productsList.map((productJson) => Products.fromJson(productJson)).toList();

      return ProductModel(
        products: products,
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );
    }

    return ProductModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}



class Products {
  int? id;
  String? title;
  String? description;
  var price;
  var discountPercentage;
  var rating;
 var stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
