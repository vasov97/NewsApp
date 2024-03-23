import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/feature_daily_news/domain/entitites/article.dart';
import 'package:news_app/features/feature_daily_news/domain/use_cases/get_saved_article.dart';
import 'package:news_app/features/feature_daily_news/domain/use_cases/remove_article.dart';
import 'package:news_app/features/feature_daily_news/domain/use_cases/save_article.dart';

part 'artcile_event.dart';
part 'artcile_state.dart';

class ArtcileBloc extends Bloc<ArtcileEvent, ArtcileState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  ArtcileBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const ArticleLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<ArtcileState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(ArticleDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<ArtcileState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(ArticleDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<ArtcileState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(ArticleDone(articles));
  }
}
