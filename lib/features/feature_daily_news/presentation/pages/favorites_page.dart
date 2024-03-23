import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/base/di/app_dependencies.dart';
import 'package:news_app/features/feature_daily_news/domain/entitites/article.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/artcile_bloc.dart';
import 'package:news_app/features/feature_daily_news/presentation/widgets/article_widget.dart';

@RoutePage()
class FavoritePage extends HookWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<ArtcileBloc>()..add(const GetSavedArticles()),
      child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onBackButtonTapped(context),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
            title: const Text('Saved Articles'),
          ),
          body: BlocBuilder<ArtcileBloc, ArtcileState>(
            builder: (context, state) {
              if (state is ArticleLoading) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state is ArticleDone) {
                return state.articles!.isEmpty
                    ? const Center(
                        child: Text(
                        'NO SAVED ARTICLES',
                      ))
                    : ListView.builder(
                        itemCount: state.articles!.length,
                        itemBuilder: (context, index) {
                          return ArticleWidget(
                            article: state.articles![index],
                            isRemovable: true,
                            onRemove: (article) =>
                                _onRemoveArticle(context, article),
                            onArticlePressed: (article) =>
                                _onArticlePressed(context, article),
                          );
                        },
                      );
              }
              return Container();
            },
          )),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<ArtcileBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
