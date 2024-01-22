import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_articles/domain/models/article_model.dart';

part 'articles_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class ArticlesRemoteRetroFitDataSource {
  @factoryMethod
  factory ArticlesRemoteRetroFitDataSource(Dio dio) =
      _ArticlesRemoteRetroFitDataSource;

  @GET('/articles')
  Future<List<ArticleModel>> getArticles();
}
