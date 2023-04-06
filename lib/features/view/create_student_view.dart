import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/core/extensions/context_extension.dart';
import 'package:flutter_cubit_bloc/features/view/widgets/custom_textformfield.dart';
import 'package:flutter_cubit_bloc/product/colors.dart';

import '../cubit/student_cubit.dart';
import '../models/student.dart';

class StudentCreate extends StatelessWidget {
  StudentCreate({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Create Student"),
      centerTitle: true,
    );
  }

  Form _body(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  label: "Name",
                  validator: defaultValidator,
                ),
                CustomTextFormField(
                  controller: _surnameController,
                  label: "Surname",
                  validator: defaultValidator,
                ),
                CustomTextFormField(
                  controller: _numberController,
                  label: "Number",
                  validator: defaultValidator,
                ),
                const SizedBox(height: 10),
                createButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<StudentCubit, StudentState> createButton() {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            minimumSize: Size(
              context.dynamicWitdth(0.5),
              context.dynamicHeight(0.05),
            ),
          ),
          child: const Text("Create"),
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              //create student model
              var model = Student(
                stName: _nameController.text.trim(),
                stSurname: _surnameController.text.trim(),
                stNumber: _numberController.text.trim(),
              );

              //Send model to cubit add student func
              context.read<StudentCubit>().addStudent(model);
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }

  String? defaultValidator(value) {
    if (value == null || value.trim().isEmpty) {
      return "This field cannot be left blank";
    }
  }
}
