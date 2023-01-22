import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/service_provider/models/review_model.dart';

import '../../../../../core/Error/failures.dart';
import '../../../repositries/service_provider_repo.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this.serviceProviderRepo) : super(AddReviewInitial());

  final ServiceProviderRepo serviceProviderRepo;

  addReview({required ReviewModel reviewModel}) async {
    emit(AddReviewLoading());

    var result = await serviceProviderRepo.addReview(reviewModel: reviewModel);

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(AddReviewNetworkFailure(failure.errMessage));
      } else {
        emit(AddReviewFailure(failure.errMessage));
      }
    }, (r) {
      emit(AddReviewSuccess());
    });
  }
}
