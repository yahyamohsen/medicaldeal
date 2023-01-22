part of 'add_review_cubit.dart';

abstract class AddReviewState extends Equatable {
  const AddReviewState();

  @override
  List<Object> get props => [];
}

class AddReviewInitial extends AddReviewState {}

class AddReviewLoading extends AddReviewState {}

class AddReviewFailure extends AddReviewState {
  final String errMessage;

  const AddReviewFailure(this.errMessage);
}

class AddReviewNetworkFailure extends AddReviewState {
  final String errMessage;

  const AddReviewNetworkFailure(this.errMessage);
}

class AddReviewSuccess extends AddReviewState {}
