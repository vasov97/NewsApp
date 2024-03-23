import 'package:news_app/features/feature_daily_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:news_app/base/constants/constants.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApi {
  factory NewsApi(Dio dio) = _NewsApi;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
