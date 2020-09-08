class Subject {
  String name;
  int id;
  int credits;
  String teacher;
  Subject(this.id, this.name, this.credits, this.teacher);

  factory Subject.fromJson(Map<String, dynamic> json) {
    return new Subject(
      json['id'],
      json['name'],
      json['credits'],
      json['teacher'],
    );
  }
}
