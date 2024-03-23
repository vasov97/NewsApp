import 'package:news_app/base/res/data_state.dart';
import 'package:news_app/base/use_case/use_case.dart';
import 'package:news_app/features/feature_daily_news/domain/entitites/article.dart';
import 'package:news_app/features/feature_daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
