import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildArticleItem(Map<String, dynamic> article, BuildContext context, Function(Map<String, dynamic>) onTap) {
  DateTime publishedDate = DateTime.parse(article['publishedAt']);
  String formattedDate = DateFormat('yyyy-MM-dd – h:mm a').format(publishedDate);

  return Material(
    color: Colors.grey.withOpacity(0.25),
    child: InkWell(
      onTap: () => onTap(article),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
