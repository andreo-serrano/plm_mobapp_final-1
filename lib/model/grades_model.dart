


// ---------------------------------------------------------------------------
// GRADES RESPONSE AND REQUEST MODEL

class GradesResponseModel {
  String aysem;
  String subjectCode;
  String subjectTitle;
  String grades;
  String remarks;

  GradesResponseModel({
    required this.aysem,
    required this.subjectCode,
    required this.subjectTitle,
    required this.grades,
    required this.remarks,
  });

  factory GradesResponseModel.fromJson(Map<String, dynamic> json) {
    return GradesResponseModel(
      aysem: json['aysem'] ?? '',
      subjectCode: json['subjectcode'] ?? '',
      subjectTitle: json['subjecttitle'] ?? '',
      grades: json['grades'] ?? '',
      remarks: json['remarks'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'aysem': aysem,
    'subjectcode': subjectCode,
    'subjecttitle': subjectTitle,
    'grades': grades,
    'remarks': remarks,
  };
}

class YearTerm {
  String year;
  String term;
  List<GradesResponseModel> grades;

  YearTerm({
    required this.year,
    required this.term,
    required this.grades,
  });

  factory YearTerm.fromJson(Map<String, dynamic> json) {
    return YearTerm(
      year: json['year'] ?? '',
      term: json['term'] ?? '',
      grades: List<GradesResponseModel>.from(
          json['grades'].map((grade) => GradesResponseModel.fromJson(grade))),
    );
  }
}

class PEResponseModel {
  String classId;
  String classCode;
  String title;
  String schedule;
  String slot;
  String enrolled;


  PEResponseModel({
    required this.classId,
    required this.classCode,
    required this.title,
    required this.schedule,
    required this.slot,
    required this.enrolled,
  });

  factory PEResponseModel.fromJson(Map<String, dynamic> json) {
    return PEResponseModel(
      classId: json['classId'] ?? '',
      classCode: json['classCode'] ?? '',
      title: json['title'] ?? '',
      schedule: json['schedule'] ?? '',
      slot: json['slot'] ?? '',
      enrolled: json['enrolled'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'classId': classId,
    'classCode': classCode,
    'title': title,
    'schedule': schedule,
    'slot': slot,
    'enrolled': enrolled,
  };
}

class PEList {
  String classId;
  String classCode;
  String title;
  String schedule;
  String slot;
  String enrolled;
  // List<PEResponseModel> peLists;

  PEList({
    required this.classId,
    required this.classCode,
    required this.title,
    required this.schedule,
    required this.slot,
    required this.enrolled,
    // required this.peLists,
  });

  factory PEList.fromJson(Map<String, dynamic> json) {
    return PEList(
      classId: json['classId'] ?? '',
      classCode: json['classCode'] ?? '',
      title: json['title'] ?? '',
      schedule: json['schedule'] ?? '',
      slot: json['slot'] ?? '',
      enrolled: json['enrolled'] ?? '',
      // peLists: List<PEResponseModel>.from(
      //     json['peLists'].map((peList) => PEResponseModel.fromJson(peList))),
    );
  }
}
