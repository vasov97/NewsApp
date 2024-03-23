import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/feature_daily_news/data/data_sources/local/app_database.dart';
import 'package:news_app/features/feature_daily_news/data/data_sources/remote/news_api.dart';
import 'package:news_app/features/feature_daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/feature_daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/feature_daily_news/domain/use_cases/get_article.dart';
import 'package:news_app/features/feature_daily_news/domain/use_cases/get_saved_article.dart';
import 'package:news_app/features/feature_daily_news/domain/use_cases/remove_article.dart';
import 'package:news_app/features/feature_daily_news/domain/use_cases/save_article.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/artcile_bloc.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:news_app/features/feature_daily_news/presentation/bloc/theme_switch/theme_switch_bloc.dart';

final instance = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  instance.registerSingleton<AppDatabase>(database);

  instance.registerSingleton<Dio>(Dio());

  instance.registerSingleton<NewsApi>(NewsApi(instance()));

  instance.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(instance(), instance()));

  instance.registerSingleton<GetArticleUseCase>(GetArticleUseCase(instance()));

  instance.registerSingleton<GetSavedArticleUseCase>(
      GetSavedArticleUseCase(instance()));

  instance
      .registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(instance()));

  instance.registerSingleton<RemoveArticleUseCase>(
      RemoveArticleUseCase(instance()));

  instance
      .registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(instance()));

  instance.registerFactory<ArtcileBloc>(
      () => ArtcileBloc(instance(), instance(), instance()));

  instance.registerSingleton<ThemeSwitchBloc>(ThemeSwitchBloc());
}
