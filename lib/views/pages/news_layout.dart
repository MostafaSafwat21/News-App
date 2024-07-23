import 'package:flutter/material.dart';
import 'package:news/views/pages/bottomNavbar.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        leading: const Icon(
          Icons.menu,
        ),
        centerTitle: true,
        title: Text(
          'Daily News',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: const BottomNavBar(),
    );
  }
}
