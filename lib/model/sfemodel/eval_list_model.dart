class EvaluationListModel {
  int studentId;
  int classId;
  int facultyId;
  String updatedOn;
  int fromDb;
  int i1;
  int i2;
  int i3;
  int i4;
  int i5;
  int i6;
  int i7;
  int i8;
  int i9;
  int i10;
  int i11;
  int i12;
  int i13;
  int i14;
  int i15;
  int i16;
  int i17;
  int i18;
  int i19;
  int i20;
  int i21;
  int i22;
  int i23;
  int i24;
  int i25;
  int i26;
  int i27;
  int i28;
  int i29;
  int i30;
  int i31;
  int i32;
  int i33;
  int i34;
  int i35;
  int i36;
  int i37;
  int i38;
  int i39;
  int i40;
  int i411;
  int i412;
  int i413;
  int i414;
  int i415;
  int i416;
  int i417;
  String i418;
  int i42;
  int i43;
  String i44;
  int i45;
  String i46;
  String i47;
  String i48;
  String i49;
  int ii1;
  int ii2;
  int ii3;
  int ii4;
  int ii5;
  int ii6;
  int ii7;
  int ii8;
  int ii9;
  String ii10;
  String ii11;
  int ii12;
  int ii13;
  int ii14;
  String ii15;
  String ii16;
  int iii1;
  int iii2;
  int iii3;
  int iii4;
  int iii5;
  int iii6;
  int iii7;
  int iii8;
  int iii9;
  String iii10;

  EvaluationListModel({
    required this.studentId,
    required this.classId,
    required this.facultyId,
    required this.updatedOn,
    required this.fromDb,
    required this.i1,
    required this.i2,
    required this.i3,
    required this.i4,
    required this.i5,
    required this.i6,
    required this.i7,
    required this.i8,
    required this.i9,
    required this.i10,
    required this.i11,
    required this.i12,
    required this.i13,
    required this.i14,
    required this.i15,
    required this.i16,
    required this.i17,
    required this.i18,
    required this.i19,
    required this.i20,
    required this.i21,
    required this.i22,
    required this.i23,
    required this.i24,
    required this.i25,
    required this.i26,
    required this.i27,
    required this.i28,
    required this.i29,
    required this.i30,
    required this.i31,
    required this.i32,
    required this.i33,
    required this.i34,
    required this.i35,
    required this.i36,
    required this.i37,
    required this.i38,
    required this.i39,
    required this.i40,
    required this.i411,
    required this.i412,
    required this.i413,
    required this.i414,
    required this.i415,
    required this.i416,
    required this.i417,
    required this.i418,
    required this.i42,
    required this.i43,
    required this.i44,
    required this.i45,
    required this.i46,
    required this.i47,
    required this.i48,
    required this.i49,
    required this.ii1,
    required this.ii2,
    required this.ii3,
    required this.ii4,
    required this.ii5,
    required this.ii6,
    required this.ii7,
    required this.ii8,
    required this.ii9,
    required this.ii10,
    required this.ii11,
    required this.ii12,
    required this.ii13,
    required this.ii14,
    required this.ii15,
    required this.ii16,
    required this.iii1,
    required this.iii2,
    required this.iii3,
    required this.iii4,
    required this.iii5,
    required this.iii6,
    required this.iii7,
    required this.iii8,
    required this.iii9,
    required this.iii10,
  });

  factory EvaluationListModel.fromJson(Map<String, dynamic> json) {
    return EvaluationListModel(
      studentId: int.parse(json['studentid']),
      classId: int.parse(json['classid']),
      facultyId: int.parse(json['facultyid']),
      updatedOn: json['updatedon'],
      fromDb: json['fromdb'],
      i1: int.parse(json['I-1']),
      i2: int.parse(json['I-2']),
      i3: int.parse(json['I-3']),
      i4: int.parse(json['I-4']),
      i5: int.parse(json['I-5']),
      i6: int.parse(json['I-6']),
      i7: int.parse(json['I-7']),
      i8: int.parse(json['I-8']),
      i9: int.parse(json['I-9']),
      i10: int.parse(json['I-10']),
      i11: int.parse(json['I-11']),
      i12: int.parse(json['I-12']),
      i13: int.parse(json['I-13']),
      i14: int.parse(json['I-14']),
      i15: int.parse(json['I-15']),
      i16: int.parse(json['I-18']),
      i17: int.parse(json['I-17']),
      i18: int.parse(json['I-18']),
      i19: int.parse(json['I-19']),
      i20: int.parse(json['I-20']),
      i21: int.parse(json['I-21']),
      i22: int.parse(json['I-22']),
      i23: int.parse(json['I-23']),
      i24: int.parse(json['I-24']),
      i25: int.parse(json['I-25']),
      i26: int.parse(json['I-26']),
      i27: int.parse(json['I-27']),
      i28: int.parse(json['I-28']),
      i29: int.parse(json['I-29']),
      i30: int.parse(json['I-30']),
      i31: int.parse(json['I-31']),
      i32: int.parse(json['I-32']),
      i33: int.parse(json['I-33']),
      i34: int.parse(json['I-34']),
      i35: int.parse(json['I-35']),
      i36: int.parse(json['I-36']),
      i37: int.parse(json['I-37']),
      i38: int.parse(json['I-38']),
      i39: int.parse(json['I-39']),
      i40: int.parse(json['I-40']),
      i411: int.parse(json['I-41_1']), // Assuming 'I-41.1' is an integer
      i412: int.parse(json['I-41_2']), // Assuming 'I-41.2' is an integer
      i413: int.parse(json['I-41_3']), // Assuming 'I-41.3' is an integer
      i414: int.parse(json['I-41_4']), // Assuming 'I-41.4' is an integer
      i415: int.parse(json['I-41_5']), // Assuming 'I-41.5' is an integer
      i416: int.parse(json['I-41_6']), // Assuming 'I-41.6' is an integer
      i417: int.parse(json['I-41_7']), // Assuming 'I-41.7' is an integer
      i418: json['I-41_8'], // Assuming 'I-41.8' is an integer
      i42: int.parse(json['I-42']),
      i43: int.parse(json['I-43']),
      i44:  json['I-44'],
      i45: int.parse(json['I-45']),
      i46:  json['I-46'],
      i47: json['I-47'],
      i48: json['I-48'],
      i49: json['I-49'],
      ii1: int.parse(json['II-1']),
      ii2: int.parse(json['II-2']),
      ii3: int.parse(json['II-3']),
      ii4: int.parse(json['II-4']),
      ii5: int.parse(json['II-5']),
      ii6: int.parse(json['II-6']),
      ii7: int.parse(json['II-7']),
      ii8: int.parse(json['II-8']),
      ii9: int.parse(json['II-9']),
      ii10: json['II-10'],
      ii11: json['II-11'],
      ii12: int.parse(json['II-12']),
      ii13: int.parse(json['II-13']),
      ii14: int.parse(json['II-14']),
      ii15: json['II-15'],
      ii16: json['II-16'],
      iii1: int.parse(json['III-1']),
      iii2: int.parse(json['III-2']),
      iii3: int.parse(json['III-3']),
      iii4: int.parse(json['III-4']),
      iii5: int.parse(json['III-5']),
      iii6: int.parse(json['III-6']),
      iii7: int.parse(json['III-7']),
      iii8: int.parse(json['III-8']),
      iii9: int.parse(json['III-9']),
      iii10: json['III-10'],
    );
  }
}