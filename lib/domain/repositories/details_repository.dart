import 'package:user_articles/data/remote_data_sources/details_remote_data_source.dart';
import 'package:user_articles/domain/models/details_model.dart';

class DetailsRepository {
  DetailsRepository({required this.remoteDataSource});

  final DetailsRemoteRetroFitDataSource remoteDataSource;

  Future<List<DetailsModel>> getDetailsForArticleId(int id) async {
    final allDetails = await remoteDataSource.getDetails();
    return allDetails.where((details) => details.id == id).toList();
  }
}
