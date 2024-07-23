import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/controllers/news_cubit.dart';
import 'package:news/controllers/news_state.dart';
import 'package:news/views/widgets/article_builder.dart';
import 'package:news/views/widgets/custom_carsoul_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getGeneral(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit = NewsCubit.get(context);
          cubit.fetchImages();
          var list = cubit.general;
          var imgList = cubit.imgList;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: Column(
                children: [
                  CustomCarouselSlider(imgList: imgList,),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: articleBuilder(list, context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
