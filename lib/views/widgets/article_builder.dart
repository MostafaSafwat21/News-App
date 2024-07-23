import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news/views/widgets/article_details_screen.dart';
import 'package:news/views/widgets/build_article_item.dart';

Widget articleBuilder(List<dynamic> list, BuildContext context) {
  return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 4.0),
  child: ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItem(
        list[index],
        context,
            (article) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailsScreen(article: article),
            ),
          );
        },
      ),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: Container(height: 0.0, color: Colors.black),
      ),
      itemCount: list.length,
    ),
    fallback: (context) => const Center(child: CircularProgressIndicator()),
  ),
);
}
