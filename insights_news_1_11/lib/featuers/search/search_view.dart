import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/core/utils/styles.dart';
import 'package:insights_news_1_11/featuers/news/cubit/news_cubit.dart';
import 'package:insights_news_1_11/featuers/search/widgets/news_list.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search for News')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              style: getBodyStyle(),
              cursorColor: AppColors.lemonadaColor,
              onChanged: (value) {
                context.read<NewsCubit>().getNewsBySearch(value);
              },
              decoration: InputDecoration(
                  hintText: 'Search for news',
                  fillColor: AppColors.containerBg,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.white,
                  )),
            ),
            const Gap(15),
            const Expanded(child: NewsSearchListBuilder())
          ],
        ),
      ),
    );
  }
}
