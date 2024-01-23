import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_articles/domain/models/details_model.dart';

part 'details_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class DetailsRemoteRetroFitDataSource {
  @factoryMethod
  factory DetailsRemoteRetroFitDataSource(Dio dio) =
      _DetailsRemoteRetroFitDataSource;

  @GET('/articles')
  Future<List<DetailsModel>> getDetails();
}
