part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

final class RemoteArticleLoading extends RemoteArticleState {}

final class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article)
      : super(articles: article);
}

final class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException error) : super(error: error);
}
