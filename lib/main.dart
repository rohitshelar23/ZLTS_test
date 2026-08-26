import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/cubit/complaint_cubit.dart';
import 'presentation/screens/mobile.dart';
import 'repositories/complaint_repository.dart';
import 'services/api_service.dart';

void main() {
final apiService = ApiService();
final complaintRepository = ComplaintRepository(apiService);

  runApp(
  BlocProvider(
          create: (context) => ComplaintCubit(complaintRepository),
          child: const MyApp(),
        ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Complaints & Opinions',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const MobileScreen(),
    );
  }
}
