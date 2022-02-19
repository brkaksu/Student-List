import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc/cubit/student_repository.dart';
import 'package:flutter_cubit_bloc/models/student.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit(this._studentRepository)
      : super(StudentInitial(_studentRepository.initialStudentList));

  final StudentRepository _studentRepository;

  Future<void> addStudent(Student student) async {
    emit(const StudentLoading());
    await Future.delayed(const Duration(seconds: 5));
    List<Student> list = _studentRepository.addStudent(Student(
        stName: student.stName,
        stSurname: student.stSurname,
        stNumber: student.stNumber));
    emit(StudentLoaded(list));
  }

  Future<void> deleteStudent(String number) async {
    emit(const StudentLoading());
    await Future.delayed(const Duration(seconds: 5));
    var list = _studentRepository.deleteStudent(number);
    emit(StudentLoaded(list));
  }
}
