import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/products/controllers/product_controller.dart';
import '../services/storage_service.dart';
import '../theme/theme_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => ProductController());
  }
}

Future<void> initServices() async {
  await Get.putAsync(() => SharedPreferences.getInstance());
  await Get.putAsync(() => StorageService().init());
}
