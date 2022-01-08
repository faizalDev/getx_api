import 'package:getx_api/model/product_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    try {
      var response = await client.get(Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return responseModelFromJson(jsonString);
      }
    } finally {
      client.close();
    }
  }
}
