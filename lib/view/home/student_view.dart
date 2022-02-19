import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/cubit/student_cubit.dart';
import 'package:flutter_cubit_bloc/cubit/student_repository.dart';
import 'package:flutter_cubit_bloc/view/create/create_student.dart';
import 'package:flutter_cubit_bloc/view/delete/student_delete.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("build methodu calisti!");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student List"),
        actions: [
          addIcon(context),
          deleteIcon(context),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocConsumer<StudentCubit, StudentState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is StudentInitial) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(
                              "${state.studentList[index].stName} ${state.studentList[index].stSurname}"),
                          subtitle:
                              Text('${state.studentList[index].stNumber}'),
                        ),
                      ),
                    ),
                    itemCount: state.studentList.length,
                  ),
                );
              } else if (state is StudentLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is StudentLoaded) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                  "${state.studentList[index].stName} ${state.studentList[index].stSurname}"),
                              subtitle:
                                  Text("${state.studentList[index].stNumber}"),
                            ),
                          ),
                        ),
                        itemCount: state.studentList.length,
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("Bos");
              }
            },
          ),
        ],
      ),
    );
  }

  IconButton deleteIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentDelete()));
      },
    );
  }

  IconButton addIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentCreate(),
            ));
      },
    );
  }

  Column buildStudentPageView(BuildContext context) {
    return Column(
      children: <Widget>[
        studentList(context),
      ],
    );
  }

  BlocConsumer<StudentCubit, StudentState> studentList(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is StudentInitial) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                        "${state.studentList[index].stName} ${state.studentList[index].stSurname}"),
                    subtitle: Text('${state.studentList[index].stNumber}'),
                  ),
                ),
              ),
              itemCount: state.studentList.length,
            ),
          );
        } else if (state is StudentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StudentLoaded) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(
                          "${state.studentList[index].stName} ${state.studentList[index].stSurname}"),
                      subtitle: Text("${state.studentList[index].stNumber}"),
                    ),
                  ),
                  itemCount: 4,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              )
            ],
          );
        } else {
          return const Text("Bos");
        }
      },
    );
  }

  Container buildStudentList(BuildContext context, StudentState state) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemBuilder: (context, index) => const Card(
          elevation: 5,
          child: ListTile(
            title: Text(""),
            subtitle: Text("Student number"),
          ),
        ),
        itemCount: 4,
      ),
    );
  }

  Text studentCount(BuildContext context) {
    return const Text(
      "Student count : ",
      style: TextStyle(fontSize: 30),
    );
  }
}
