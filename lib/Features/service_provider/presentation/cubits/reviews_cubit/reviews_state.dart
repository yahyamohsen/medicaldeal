part of 'reviews_cubit.dart';

abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsFailure extends ReviewsState {
  final String errMessage;

  const ReviewsFailure(this.errMessage);
}

class ReviewsNetworkFailure extends ReviewsState {
  final String errMessage;

  const ReviewsNetworkFailure(this.errMessage);
}

class ReviewsSuccess extends ReviewsState {
  final List<ReviewModel> reviews;

  const ReviewsSuccess(this.reviews);
}
