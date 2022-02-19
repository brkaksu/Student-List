import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/cubit/student_cubit.dart';
import 'package:flutter_cubit_bloc/cubit/student_repository.dart';

import '../../models/student.dart';

class StudentCreate extends StatefulWidget {
  StudentCreate({Key? key}) : super(key: key);

  @override
  State<StudentCreate> createState() => _StudentCreateState();
}

class _StudentCreateState extends State<StudentCreate> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Student"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [studentForm(context)],
          ),
        ),
      ),
    );
  }

  Form studentForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text("Name"),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.amber[700],
                  fontSize: 16,
                ),
                enabledBorder: undelineInputBorder(),
                focusedBorder: undelineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _surnameController,
              decoration: InputDecoration(
                label: Text("Surname"),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.amber[700],
                  fontSize: 16,
                ),
                enabledBorder: undelineInputBorder(),
                focusedBorder: undelineInputBorder(),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: _numberController,
              decoration: InputDecoration(
                label: Text("Number"),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.amber[700],
                  fontSize: 16,
                ),
                enabledBorder: undelineInputBorder(),
                focusedBorder: undelineInputBorder(),
              ),
            ),
            SizedBox(height: 60),
            BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber[300]),
                  child: const Text("Kaydet"),
                  onPressed: () {
                    context.read<StudentCubit>().addStudent(
                          Student(
                            stName: _nameController.text,
                            stSurname: _surnameController.text,
                            stNumber: _numberController.text,
                          ),
                        );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  UnderlineInputBorder undelineInputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.amber,
        width: 2,
      ),
    );
  }

  void createStudent(BuildContext context) {}
}
