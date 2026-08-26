import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/complaint_repository.dart';
import 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  final ComplaintRepository repository;

  ComplaintCubit(this.repository) : super(const ComplaintInitial());

  Future<void> fetchComplaints() async {
    emit(const ComplaintLoading());

    try {
      final complaints = await repository.getComplaints();

      emit(ComplaintLoaded(complaints));
    } catch (e) {
      emit(ComplaintError(e.toString()));
    }
  }
}