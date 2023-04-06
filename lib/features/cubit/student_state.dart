part of 'student_cubit.dart';

class StudentState extends Equatable {
  List<Student>? studentList;
  StudentState({this.studentList});

  @override
  List<Object?> get props => [studentList];

  StudentState copyWith({List<Student>? studentList}) {
    return StudentState(
      studentList: studentList ?? this.studentList,
    );
  }
}
