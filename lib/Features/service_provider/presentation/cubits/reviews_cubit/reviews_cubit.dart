import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/service_provider/models/review_model.dart';

import '../../../../../core/Error/failures.dart';
import '../../../repositries/service_provider_repo.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this.serviceProviderRepo) : super(ReviewsInitial());

  final ServiceProviderRepo serviceProviderRepo;

  List<ReviewModel>? reviews;
  getReviews({required String id}) async {
    emit(ReviewsLoading());

    var result = await serviceProviderRepo.getReviews(id: id);

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(ReviewsNetworkFailure(failure.errMessage));
      } else {
        emit(ReviewsFailure(failure.errMessage));
      }
    }, (r) {
      reviews = r;
      emit(ReviewsSuccess(r));
    });
  }
}
