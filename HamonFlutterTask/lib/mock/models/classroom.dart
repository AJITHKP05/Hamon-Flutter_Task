class Classroom {
  String name;
  int id;
  int size;
  String layout;
  String subject;
  Classroom(this.id, this.name, this.size, this.layout, {this.subject});

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return new Classroom(
      json['id'],
      json['name'],
      json['size'],
      json['layout'],
    );
  }
}
