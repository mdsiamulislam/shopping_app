import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();
  final StorageService _storageService = Get.find<StorageService>();

  // Rx variables
  final RxList<ProductModel> _allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxString searchQuery = ''.obs;
  final RxSet<int> favoriteProductIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
    fetchProducts();
    
    // Setup search listener
    ever(searchQuery, (_) => filterProducts());
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      final products = await _productService.fetchProducts();
      _allProducts.assignAll(products);
      filterProducts();
    } catch (e) {
      errorMessage('Failed to load products. \nPlease try again.');
    } finally {
      isLoading(false);
    }
  }

  void filterProducts() {
    if (searchQuery.isEmpty) {
      filteredProducts.assignAll(_allProducts);
    } else {
      filteredProducts.assignAll(
        _allProducts.where((product) =>
            product.title.toLowerCase().contains(searchQuery.value.toLowerCase())).toList(),
      );
    }
  }

  void loadFavorites() {
    favoriteProductIds.assignAll(_storageService.getFavorites());
  }

  void toggleFavorite(int id) {
    if (favoriteProductIds.contains(id)) {
      favoriteProductIds.remove(id);
    } else {
      favoriteProductIds.add(id);
    }
    _storageService.saveFavorites(favoriteProductIds.toList());
  }

  bool isFavorite(int id) {
    return favoriteProductIds.contains(id);
  }

  List<ProductModel> get favoriteProducts {
    return _allProducts.where((p) => favoriteProductIds.contains(p.id)).toList();
  }
}
