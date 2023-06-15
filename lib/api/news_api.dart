import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../model/news_result.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class NewsApi {
  factory NewsApi(Dio dio, {String baseUrl}) = _NewsApi;

  @GET('top-headlines?country=jp&apiKey={key}')
  Future<NewsResult> getNews(@Path('key') String apiKey);
}
