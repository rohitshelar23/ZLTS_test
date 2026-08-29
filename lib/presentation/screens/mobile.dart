import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/complaint_cubit.dart';
import '../cubit/complaint_state.dart';
import '../widgets/complaint_card.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
      ),
      body: BlocBuilder<ComplaintCubit, ComplaintState>(
        builder: (context, state) {
          if (state is ComplaintLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ComplaintError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is ComplaintLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.complaints.length,
              itemBuilder: (context, index) {
                final complaint = state.complaints[index];

                return ComplaintCard(
                  complaint: complaint,
                );
              },
            );
          }

          return const Center(
            child: Text('No complaints found'),
          );
        },
      ),
    );
  }
}
