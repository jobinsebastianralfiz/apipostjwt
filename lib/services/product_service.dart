import 'dart:convert';

import 'package:apiauthjwtdemo/api/api.dart';
import 'package:apiauthjwtdemo/models/productmodel.dart';
import 'package:apiauthjwtdemo/models/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  final client = http.Client();

  Future<ProductModel?> getAllProducts() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    final token = _pref.get('token');
    print(token);

    try {
      final resposnse = await client
          .get(Uri.parse("${API().baseUrl}${API().allProducts}"), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      });

      if (resposnse.statusCode == 200) {
        final responseBody = jsonDecode(resposnse.body);

        final ProductModel product = ProductModel.fromJson(responseBody);
       print(product);
        return product;
      }
    } catch (e) {
      print("$e");
    }
  }
}
