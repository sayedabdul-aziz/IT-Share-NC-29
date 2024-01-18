import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_1_11/core/functions/functions.dart';
import 'package:insights_news_1_11/core/utils/app_colors.dart';
import 'package:insights_news_1_11/core/utils/styles.dart';
import 'package:insights_news_1_11/featuers/news/cubit/news_cubit.dart';
import 'package:insights_news_1_11/featuers/news/cubit/news_state.dart';
import 'package:insights_news_1_11/featuers/news/news_details_view.dart';

class NewsListBuilder extends StatelessWidget {
  const NewsListBuilder({
    super.key,
    required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getNewsByCategory(category);
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsByCategorySuccessState) {
          var news = state.model;
          return ListView.builder(
            itemCount: news.articles!.length,
            itemBuilder: (context, index) {
              var data = news.articles![index];
              return GestureDetector(
                onTap: () {
                  push(context, NewsDetailsView(model: data));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.containerBg,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data.urlToImage ?? '',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 100,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                                width: 150,
                                height: 100,
                                child: Icon(Icons.error));
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              data.title ?? '',
                              style: getTitleStyle(fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Icon(
                                  Icons.menu,
                                  color: AppColors.white,
                                  size: 14,
                                ),
                                Text(
                                  'Read',
                                  style: getBodyStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is NewsByCategoryErrorState) {
          return const Text('error');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
