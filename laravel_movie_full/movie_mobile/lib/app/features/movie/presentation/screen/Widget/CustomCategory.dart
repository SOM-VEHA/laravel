import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/home/presentation/provider/CategoryProvider.dart';

import '../../provider/movieProvider.dart';
// class CustomCategory extends ConsumerWidget {
//   CustomCategory({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final categries = ref.watch(categoryProvider);
//     final selectedId = ref.watch(selectedCategoryIdProvider);
//     return SliverPadding(padding: EdgeInsetsGeometry.all(10),
//       sliver:categries.when(
//         loading: () => const SliverToBoxAdapter(
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//         error: (error, stack) => SliverToBoxAdapter(
//           child: Center(
//             child: Text(error.toString()),
//           ),
//         ),
//         data: (category) {
//           return SliverToBoxAdapter(
//             child:SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: category.map((cat) {
//                   final isSelected = selectedId == cat.id;
//                   return GestureDetector(
//                     onTap: (){
//                       ref.read(selectedCategoryIdProvider.notifier).state = cat.id;
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(right: 10),
//                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                       decoration: BoxDecoration(
//                         color: isSelected==true ? Colors.red : Colors.grey[900],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         cat.name,
//                         style: TextStyle(
//                           color: isSelected==true ? Colors.white : Colors.grey,
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class CustomCategory extends ConsumerWidget {
  const CustomCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);
    final selectedId = ref.watch(selectedCategoryIdProvider);

    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: categories.when(
        loading: () => const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),

        error: (error, stack) => SliverToBoxAdapter(
          child: Center(
            child: Text(error.toString()),
          ),
        ),

        data: (category) {
          return SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // ALL MOVIES
                  _buildCategoryItem(
                    context: context,
                    title: 'All Movies',
                    isSelected: selectedId == null,
                    onTap: () {
                      ref.read(selectedCategoryIdProvider.notifier).state = null;
                    },
                  ),

                  // DATABASE CATEGORIES
                  ...category.map((cat) {
                    return _buildCategoryItem(
                      context: context,
                      title: cat.name,
                      isSelected: selectedId == cat.id,
                      onTap: () {
                        ref
                            .read(selectedCategoryIdProvider.notifier)
                            .state = cat.id;

                        ref
                            .read(movieProvider.notifier)
                            .loadMovies(categoryId: cat.id);
                        // ref.read(selectedCategoryIdProvider.notifier).state = cat.id;
                      },
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}