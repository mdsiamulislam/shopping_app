import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';
import '../../../routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/shimmer_loading.dart';
import '../../../core/widgets/custom_state_widget.dart';
import '../../../core/theme/theme_controller.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, themeController),
            _buildSearchBar(context, controller),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return _buildLoadingGrid();
                }

                if (controller.errorMessage.isNotEmpty) {
                  return CustomStateWidget(
                    icon: Icons.error_outline_rounded,
                    title: 'Oops! Something went wrong',
                    message: controller.errorMessage.value,
                    buttonText: 'Try Again',
                    onButtonPressed: controller.fetchProducts,
                  );
                }

                if (controller.filteredProducts.isEmpty) {
                  return const CustomStateWidget(
                    icon: Icons.search_off_rounded,
                    title: 'No Products Found',
                    message: 'Try adjusting your search to find what you\'re looking for.',
                  );
                }

                return RefreshIndicator(
                  onRefresh: controller.fetchProducts,
                  color: Theme.of(context).colorScheme.primary,
                  child: AnimationLimiter(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.72,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: controller.filteredProducts.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          columnCount: 2,
                          child: ScaleAnimation(
                            scale: 0.9,
                            child: FadeInAnimation(
                              child: ProductCard(product: controller.filteredProducts[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ThemeController themeController) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 12, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Find your best outfit',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Row(
            children: [
              Obx(() => IconButton(
                onPressed: themeController.toggleTheme,
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Icon(
                    themeController.isDarkMode.value ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              )),
              IconButton(
                onPressed: () => Get.toNamed(AppRoutes.favorites),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Icon(Icons.favorite_outline_rounded, color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, ProductController controller) {
    final TextEditingController textController = TextEditingController();
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: textController,
          onChanged: (value) => controller.searchQuery.value = value,
          style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          decoration: InputDecoration(
            hintText: 'Search for products...',
            hintStyle: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color, fontSize: 15),
            prefixIcon: Icon(Icons.search_rounded, color: Theme.of(context).textTheme.bodyMedium?.color),
            suffixIcon: controller.searchQuery.isNotEmpty 
              ? IconButton(
                  icon: Icon(Icons.clear_rounded, color: Theme.of(context).textTheme.bodyMedium?.color),
                  onPressed: () {
                    textController.clear();
                    controller.searchQuery.value = '';
                  },
                )
              : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => const ProductSkeleton(),
    );
  }
}
