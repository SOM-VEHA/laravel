import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/presentation/Widget/CustomAppbar.dart';
import '../provider/movieProvider.dart';
import 'Widget/CustomAllMovie.dart';
import 'Widget/CustomCategory.dart';

class MovieScreen extends ConsumerStatefulWidget {
  MovieScreen({super.key});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 300) {
        ref.read(movieProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [CustomAppbar(), CustomCategory(), CustomAllMovie()],
      ),
    );
  }
}
