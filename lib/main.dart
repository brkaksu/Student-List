import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/features/cubit/student_cubit.dart';
import 'package:flutter_cubit_bloc/features/view/home_view.dart';
import 'package:flutter_cubit_bloc/product/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student List',
        theme: theme,
        home: const HomeView(),
      ),
    );
  }
}
