import 'package:flutter_cubit_bloc/models/student.dart';

abstract class IStudentRepository {
  List<Student> addStudent(Student student);
  List<Student> updateStudentList(Student student);
  List<Student> deleteStudent(String studentNumber);
}

class StudentRepository extends IStudentRepository {
  List<Student> initialStudentList = [
    Student(stName: "Carr", stSurname: "Derek", stNumber: "105"),
    Student(stName: "Lang", stSurname: "Hannah", stNumber: "89"),
    Student(stName: "Neil", stSurname: "Trevor", stNumber: "208"),
  ];
  @override
  List<Student> addStudent(Student student) {
    initialStudentList.add(student);
    print(initialStudentList.last);
    return initialStudentList;
  }

  @override
  List<Student> updateStudentList(Student student) {
    initialStudentList[initialStudentList.indexWhere(
        (element) => element.stNumber == student.stNumber)] = student;
    return initialStudentList;
  }

  @override
  List<Student> deleteStudent(String studentNumber) {
    initialStudentList
        .removeWhere((element) => element.stNumber == studentNumber);
    return initialStudentList;
  }
}
