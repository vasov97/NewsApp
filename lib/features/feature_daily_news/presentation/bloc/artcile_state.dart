part of 'artcile_bloc.dart';

sealed class ArtcileState extends Equatable {
  final List<ArticleEntity>? articles;

  const ArtcileState({this.articles});

  @override
  List<Object> get props => [articles!];
}

final class ArticleLoading extends ArtcileState {
  const ArticleLoading();
}

final class ArticleDone extends ArtcileState {
  const ArticleDone(List<ArticleEntity> articles) : super(articles: articles);
}
