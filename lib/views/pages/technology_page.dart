import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/controllers/news_state.dart';
import 'package:news/views/widgets/article_builder.dart';
import 'package:news/controllers/news_cubit.dart';

class TechnologyPage extends StatelessWidget {
  const TechnologyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getTechnology(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).technology;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: articleBuilder(list, context),
          );
        },
      ),
    );
  }
}
