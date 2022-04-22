class Result {
  int? id;
  int? studentId;
  int? semesterId;
  String? grade;
  String? fail;
  String? totalPoint;
  String? createdAt;
  String? updatedAt;
  Student? student;

  Result(
      {this.id,
      this.studentId,
      this.semesterId,
      this.grade,
      this.fail,
      this.totalPoint,
      this.createdAt,
      this.updatedAt,
      this.student});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    semesterId = json['semester_id'];
    grade = json['grade'];
    fail = json['fail'];
    totalPoint = json['total_point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_id'] = studentId;
    data['semester_id'] = semesterId;
    data['grade'] = grade;
    data['fail'] = fail;
    data['total_point'] = totalPoint;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  String? name;
  int? roll;
  int? reg;
  String? session;
  int? sectionId;
  int? shiftId;
  int? semesterId;
  int? departmentId;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.id,
      this.name,
      this.roll,
      this.reg,
      this.session,
      this.sectionId,
      this.shiftId,
      this.semesterId,
      this.departmentId,
      this.createdAt,
      this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roll = json['roll'];
    reg = json['reg'];
    session = json['session'];
    sectionId = json['section_id'];
    shiftId = json['shift_id'];
    semesterId = json['semester_id'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['roll'] = roll;
    data['reg'] = reg;
    data['session'] = session;
    data['section_id'] = sectionId;
    data['shift_id'] = shiftId;
    data['semester_id'] = semesterId;
    data['department_id'] = departmentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
