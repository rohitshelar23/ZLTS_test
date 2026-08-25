class Complaint {
  final String id;
  final String complaintType;
  final String description;
  final String status;
  final String agency;
  final String borough;
  final String createdDate;

  const Complaint({
    required this.id,
    required this.complaintType,
    required this.description,
    required this.status,
    required this.agency,
    required this.borough,
    required this.createdDate,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['unique_key']?.toString() ?? '',
      complaintType: json['complaint_type'] ?? 'Unknown',
      description: json['descriptor'] ?? 'No description available',
      status: json['status'] ?? 'Unknown',
      agency: json['agency'] ?? 'Unknown',
      borough: json['borough'] ?? 'Unknown',
      createdDate: json['created_date'] ?? '',
    );
  }
}