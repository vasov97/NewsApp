import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/feature_daily_news/domain/entitites/article.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/theme_switch/theme_switch_bloc.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/theme_switch/theme_switch_event.dart';
import 'package:news_app/features/feature_daily_news/presentation/widgets/article_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            BlocBuilder<ThemeSwitchBloc, ThemeData>(builder: (context, state) {
          return CupertinoSwitch(
            value: state == ThemeData.dark(),
            onChanged: (value) {
              context.read<ThemeSwitchBloc>().add(ThemeSwitching());
            },
          );
        }),
        title: const Text(
          'Sports news',
        ),
        actions: [
          GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(
                Icons.bookmark,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
          if (state is RemoteArticleLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteArticleError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteArticleDone) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleWidget(
                  article: state.articles![index],
                  onArticlePressed: (article) =>
                      _onArticlePressed(context, article),
                );
              },
              itemCount: state.articles!.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

void _onArticlePressed(BuildContext context, ArticleEntity article) {
  Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
}

void _onShowSavedArticlesViewTapped(BuildContext context) {
  Navigator.pushNamed(context, '/SavedArticles');
}
