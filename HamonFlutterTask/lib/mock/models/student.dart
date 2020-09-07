class Student {
  String name;
  int id;
  int age;
  String email;
  Student(this.id, this.name, this.age, this.email);

  factory Student.fromJson(Map<String, dynamic> json) {
    return new Student(
      json['id'],
      json['name'],
      json['age'],
      json['email'],
    );
  }
}
