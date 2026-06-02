import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/utils/initial_bindings.dart';
import 'routes/app_routes.dart';
import 'core/theme/light_theme.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    
    return GetMaterialApp(
      title: 'Premium Shopping App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeController.theme,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
