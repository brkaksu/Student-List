import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/core/extensions/context_extension.dart';
import 'package:flutter_cubit_bloc/features/view/widgets/custom_textformfield.dart';

import '../../product/colors.dart';
import '../cubit/student_cubit.dart';

class StudentDelete extends StatelessWidget {
  StudentDelete({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() => AppBar(title: const Text("Delete Student"));

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: _numberController,
            label: "Enter student number you want to delete",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Cannot be left blank";
              }
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<StudentCubit, StudentState>(
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  minimumSize: Size(
                    context.dynamicWitdth(0.5),
                    context.dynamicHeight(0.05),
                  ),
                ),
                onPressed: () {
                  context.read<StudentCubit>().deleteStudent(_numberController.text.trim());
                  Navigator.pop(context);
                },
                child: const Text("Delete"),
              );
            },
          ),
        ],
      ),
    );
  }
}
