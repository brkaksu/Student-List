import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cubit_bloc/features/models/student.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState());

  List<Student> currList = [Student(stName: "Burak", stSurname: "Aksu", stNumber: "301")];

  Future<void> addStudent(Student student) async {
    List<Student>? tempList = [...state.studentList ?? []];
    if (!tempList.contains(student)) tempList.add(student);
    emit(state.copyWith(studentList: tempList));
  }

  Future<void> deleteStudent(String number) async {
    print(state.studentList);
    List<Student>? tempList = [...state.studentList ?? []];
    tempList.removeWhere(
      (element) => element.stNumber == number,
    );
    emit(state.copyWith(studentList: tempList));
  }
}
