import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/base/di/app_dependencies.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/artcile_bloc.dart';
import 'package:news_app/features/feature_daily_news/presentation/widgets/article_title_and_date.dart';

import '../../domain/entitites/article.dart';

@RoutePage()
class DetailsPage extends HookWidget {
  const DetailsPage(this.article, {super.key});

  final ArticleEntity? article;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<ArtcileBloc>(),
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _onBackButtonTapped(context),
              child: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ArticleTitleAndDate(article: article!),
              Container(
                width: double.maxFinite,
                height: 250,
                margin: const EdgeInsets.only(top: 14),
                child: Image.network(article!.urlToImage!, fit: BoxFit.cover),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                child: Text(
                  '${article!.description ?? ''}\n\n${article!.content ?? ''}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _onFloatingActionButtonPressed(context),
            child: const Icon(Icons.bookmark, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<ArtcileBloc>(context).add(SaveArticle(article!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Article saved successfully.'),
      ),
    );
  }
}
