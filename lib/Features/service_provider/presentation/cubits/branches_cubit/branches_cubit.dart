import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/service_provider/models/branche_model/branch_model.dart';
import 'package:sart_up_project/Features/service_provider/repositries/service_provider_repo.dart';

import '../../../../../core/Error/failures.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit(this.serviceProviderRepo) : super(BranchesInitial());

  final ServiceProviderRepo serviceProviderRepo;

  getBranches({required String id}) async {
    emit(BranchesLoading());

    var result = await serviceProviderRepo.getBranches(id: int.parse(id));

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(BranchesNetWorkFailure());
      } else {
        emit(BranchesFailure(failure.errMessage));
      }
    }, (r) {
      emit(BranchesSuccess(r));
    });
  }
}
