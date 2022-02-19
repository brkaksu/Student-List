import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/cubit/student_cubit.dart';
import 'package:flutter_cubit_bloc/cubit/student_repository.dart';
import 'package:flutter_cubit_bloc/view/home/student_view.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => StudentCubit(StudentRepository()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentPage(),
    );
  }
}
