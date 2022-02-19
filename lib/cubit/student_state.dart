part of 'student_cubit.dart';

@immutable
abstract class StudentState {
  const StudentState();
}

class StudentInitial extends StudentState {
  List<Student> studentList;
  StudentInitial(this.studentList);
}

class StudentLoading extends StudentState {
  const StudentLoading();
}

class StudentLoaded extends StudentState {
  List<Student> studentList;
  StudentLoaded(this.studentList);
}

class StudentLoadingError extends StudentState {
  const StudentLoadingError();
}
