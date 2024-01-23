import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:user_articles/app/core/enums.dart';
import 'package:user_articles/domain/models/details_model.dart';
import 'package:user_articles/domain/repositories/details_repository.dart';

part 'details_cubit.freezed.dart';
part 'details_state.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({required this.detailsRepository}) : super(DetailsState());

  final DetailsRepository detailsRepository;

  Future<void> fetchData({required int id}) async {
    emit(
      DetailsState(
        status: Status.loading,
      ),
    );
    try {
      final results = await detailsRepository.getDetailsForArticleId(id);
      emit(
        DetailsState(
          status: Status.success,
          results: results,
        ),
      );
    } catch (error) {
      emit(
        DetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
