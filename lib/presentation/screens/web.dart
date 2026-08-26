import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/complaint_cubit.dart';
import '../cubit/complaint_state.dart';
import '../widgets/complaint_card.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
      ),
      body: BlocBuilder<ComplaintCubit, ComplaintState>(
        builder: (context, state) {
          if (state is ComplaintLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ComplaintError) {
            return Center(child: Text(state.message));
          }

          if (state is ComplaintLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(24),
             gridDelegate: 
             const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 250, ),
              itemCount: state.complaints.length,
              itemBuilder: (context, index) {
                final complaint = state.complaints[index];

                return ComplaintCard(complaint: complaint);
              },
            );
          }
           return const Center(child: Text('No complaints.'));
        },
      ),
    );
  }
}

                        