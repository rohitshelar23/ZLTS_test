import 'package:flutter/material.dart';
import 'package:zlts_test/models/complaint.dart';

class ComplaintCard extends StatelessWidget {
  final Complaint complaint;

  const ComplaintCard({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              complaint.complaintType,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(complaint.description),
            const SizedBox(height: 12),
            Text('Status: ${complaint.status}'),
            Text('Agency: ${complaint.agency}'),
            Text('Borough: ${complaint.borough}'),
            const SizedBox(height: 8),
            Text(complaint.createdDate),
          ],
        ),
      ),
    );
  }
}