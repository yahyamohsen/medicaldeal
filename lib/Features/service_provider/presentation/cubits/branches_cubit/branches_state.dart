part of 'branches_cubit.dart';

abstract class BranchesState extends Equatable {
  const BranchesState();

  @override
  List<Object> get props => [];
}

class BranchesInitial extends BranchesState {}

class BranchesLoading extends BranchesState {}

class BranchesSuccess extends BranchesState {
  final List<BranchModel> branches;

  const BranchesSuccess(this.branches);
}

class BranchesFailure extends BranchesState {
  final String errMessage;

  const BranchesFailure(this.errMessage);
}

class BranchesNetWorkFailure extends BranchesState {}
