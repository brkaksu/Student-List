import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/cubit/student_cubit.dart';

class StudentDelete extends StatelessWidget {
  StudentDelete({Key? key}) : super(key: key);

  TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delete Student Page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: _numberController,
              decoration: InputDecoration(
                label: const Text("Enter the number you want to delete"),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.amber[700],
                  fontSize: 16,
                ),
                enabledBorder: undelineInputBorder(),
                focusedBorder: undelineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context
                        .read<StudentCubit>()
                        .deleteStudent(_numberController.text);
                  },
                  child: Text("DELETE"),
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
}
