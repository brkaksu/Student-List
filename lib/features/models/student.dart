import 'package:equatable/equatable.dart';

class Student extends Equatable {
  String? stName;
  String? stSurname;
  String? stNumber;
  Student({
    required this.stName,
    required this.stSurname,
    required this.stNumber,
  });

  @override
  List<Object?> get props => [stName, stSurname, stNumber];
}
