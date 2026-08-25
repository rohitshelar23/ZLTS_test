import '../../models/complaint.dart';

abstract class ComplaintState {
  const ComplaintState();
}

class ComplaintInitial extends ComplaintState {
  const ComplaintInitial();
}

class ComplaintLoading extends ComplaintState {
  const ComplaintLoading();
}

class ComplaintLoaded extends ComplaintState {
  final List<Complaint> complaints;

  const ComplaintLoaded(this.complaints);
}

class ComplaintError extends ComplaintState {
  final String message;

  const ComplaintError(this.message);
}