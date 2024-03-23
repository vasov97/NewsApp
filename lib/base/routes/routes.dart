import 'package:flutter/material.dart';
import 'package:news_app/features/feature_daily_news/domain/entitites/article.dart';
import 'package:news_app/features/feature_daily_news/presentation/pages/details_page.dart';
import 'package:news_app/features/feature_daily_news/presentation/pages/favorites_page.dart';
import 'package:news_app/features/feature_daily_news/presentation/pages/home_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());

      case '/ArticleDetails':
        return _materialRoute(DetailsPage(settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const FavoritePage());

      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
