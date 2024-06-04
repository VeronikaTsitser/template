import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // BaseAppBar(title: 'Все заметки'),
            // Padding(
            //   padding: EdgeInsets.only(left: 24),
            //   child: CategoriesRow(isAllNotes: true),
            // ),
            // Expanded(
            //   child: CustomScrollView(
            //     physics: ClampingScrollPhysics(),
            //     slivers: [
            //       SliverPadding(
            //         padding: EdgeInsets.symmetric(horizontal: 24),
            //         sliver: MyNotesWidget(isAllNotes: true),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
