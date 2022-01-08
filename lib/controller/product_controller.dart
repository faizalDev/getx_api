import 'package:get/get.dart';
import 'package:getx_api/APIService/api_service.dart';
import 'package:getx_api/model/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProductData();
    super.onInit();
  }

  void fetchProductData() async {
    try {
      isLoading(true);
      var products = await APIService.fetchProducts();
      productList.assignAll(products!);
    } finally {
      isLoading(false);
    }
  }
}
