import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  const ArticleDetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article['urlToImage'] != null)
                Image.network(article['urlToImage']),
              const SizedBox(height: 16.0),
              Text(
                article['title'],
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.blue.withOpacity(0.99)),
              ),
              const SizedBox(height: 4.0),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  color: Colors.amber,
                  child: Text(
                    ' By: ${article['author']} ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.brown),
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                article['content'] ?? 'No content available',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
