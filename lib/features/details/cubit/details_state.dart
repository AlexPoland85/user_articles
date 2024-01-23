part of 'details_cubit.dart';

class DetailsState {
  DetailsState({
    this.results = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<DetailsModel> results;
  final Status status;
  final String? errorMessage;
}
