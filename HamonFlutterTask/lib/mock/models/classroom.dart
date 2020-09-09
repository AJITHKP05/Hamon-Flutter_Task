import 'package:HamonFlutterTask/mock/models/student.dart';
import 'package:HamonFlutterTask/mock/models/subject.dart';

class Classroom {
  String name;
  int id;
  int size;
  String layout;
  Subject subject;
  List<Student> students;

  Classroom(this.id, this.name, this.size, this.layout,
      {this.subject, this.students});

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return new Classroom(
      json['id'],
      json['name'],
      json['size'],
      json['layout'],
    );
  }
}
