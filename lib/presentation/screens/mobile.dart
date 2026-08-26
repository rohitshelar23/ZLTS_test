import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/complaint_cubit.dart';
import '../cubit/complaint_state.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ComplaintCubit>().fetchComplaints();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Complaints'),
      ),
      body:BlocBuilder<ComplaintCubit, ComplaintState>
      (builder: (context,state) {
        if (state is ComplaintLoading) {
          return const Center(child: CircularProgressIndicator());
        } 

        if(state is ComplaintError){
          return Center(child: Text(state.message));
        }
        
        if (state is ComplaintLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.complaints.length,
            itemBuilder: (context, index) {
              final complaint = state.complaints[index];
             
             return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
               padding: const EdgeInsets.all(16),
               child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
               children: [
                Text(
                  complaint.complaintType,
                 style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                
               ),
              
              const SizedBox(height: 8), 
              Text(complaint.description),
              const SizedBox(height: 12),
              Text('Status: ${complaint.status}'),
                Text('Agency: ${complaint.agency}'),
                Text('Borough: ${complaint.borough}'),
                const SizedBox(height:8),
                Text(complaint.createdDate),
              
               ],
              ),
            ),
        );
      },
    );
  } 

          return const Center( child: Text('No complaints.'),
          );
        },
      ),
     );
   }
  }