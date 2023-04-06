import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/student_cubit.dart';
import 'create_student_view.dart';
import 'delete_student_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text("Student List"),
      actions: [
        addIcon(context),
        deleteIcon(context),
      ],
    );
  }

  dynamic _body(context) {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        print(state.studentList);
        return ListView.builder(
            //if student list null itemcount 0
            itemCount: state.studentList?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text("${state.studentList?[index].stName} ${state.studentList?[index].stSurname}"),
                    subtitle: Text('${state.studentList?[index].stNumber}'),
                  ),
                ),
              );
            });
      },
    );
  }

  IconButton deleteIcon(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDelete()));
      },
    );
  }

  IconButton addIcon(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentCreate()));
      },
    );
  }
}
