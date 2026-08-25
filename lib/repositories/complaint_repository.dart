import '../models/complaint.dart';
import '../services/api_service.dart';

class ComplaintRepository {
  final ApiService apiService;

  ComplaintRepository(this.apiService);

  Future<List<Complaint>> getComplaints() async {
    final data = await apiService.getComplaints();

    return data
        .map((item) => Complaint.fromJson(item))
        .toList();
  }
}