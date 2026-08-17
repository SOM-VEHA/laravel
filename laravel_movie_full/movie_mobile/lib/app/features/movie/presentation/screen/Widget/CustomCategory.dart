import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/home/presentation/provider/CategoryProvider.dart';
class CustomCategory extends ConsumerWidget {
  CustomCategory({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categries = ref.watch(categoryProvider);
    final selectedId = ref.watch(selectedCategoryIdProvider);
    return SliverPadding(padding: EdgeInsetsGeometry.all(10),
      sliver:categries.when(
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
            child:SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: category.map((cat) {
                  final isSelected = selectedId == cat.id;
                  return GestureDetector(
                    onTap: (){
                      ref.read(selectedCategoryIdProvider.notifier).state = cat.id;
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected==true ? Colors.red : Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cat.name,
                        style: TextStyle(
                          color: isSelected==true ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}