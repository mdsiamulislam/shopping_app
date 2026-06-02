import 'package:get/get.dart';
import '../features/products/screens/product_listing_screen.dart';
import '../features/products/screens/product_details_screen.dart';
import '../features/products/screens/favorite_screen.dart';
import '../features/products/models/product_model.dart';

class AppRoutes {
  static const String initial = '/';
  static const String details = '/details';
  static const String favorites = '/favorites';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const ProductListingScreen(),
    ),
    GetPage(
      name: details,
      page: () {
        final ProductModel product = Get.arguments;
        return ProductDetailsScreen(product: product);
      },
    ),
    GetPage(
      name: favorites,
      page: () => const FavoriteScreen(),
    ),
  ];
}
