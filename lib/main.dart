import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/utils/initial_bindings.dart';
import 'routes/app_routes.dart';

import 'core/constants/app_theme.dart';
import 'core/constants/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Premium Shopping App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
