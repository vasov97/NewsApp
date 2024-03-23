part of 'artcile_bloc.dart';

sealed class ArtcileEvent extends Equatable {
  final ArticleEntity? article;

  const ArtcileEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends ArtcileEvent {
  const GetSavedArticles();
}

class RemoveArticle extends ArtcileEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}

class SaveArticle extends ArtcileEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}
