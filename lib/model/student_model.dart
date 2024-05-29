// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// --------------------------------------------------------------------------
// USER RESPONSE AND REQUEST MODEL
class UserResponseModel {
  final String userid;
  final String username;
  final String studentid;
  final String firstname;
  final String lastname;
  final String email;
  final String detail;
  final String mailnickname;
  final String role;

  UserResponseModel(
      {
        required this.userid,
        required this.username,
        required this.studentid,
        required this.firstname,
        required this.lastname,
        required this.email,
        required this.detail,
        required this.mailnickname, required this.role,});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      userid: json["userid"] ?? "",
      username: json["username"] ?? "",
      studentid: json["studentid"] ?? "",
      firstname: json["firstname"] ?? "",
      lastname: json["lastname"] ?? "",
      email: json["email"] ?? "",
      detail: json["detail"] ?? "",
      mailnickname: json["mailnickname"] ?? "",
      role: json["role"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userid': userid.trim(),
      'username': username.trim(),
      'studentid': studentid.trim(),
      'firstname': firstname.trim(),
      'lastname': lastname.trim(),
      'email': email.trim(),
      'detail': detail.trim(),
      'mailnickname': mailnickname.trim(),
      'role': role.trim(),
    };
    return map;
  }
}

//
class SchoolInformationModel {
  final String classStart ;
  final String aysem ;
  final String userid ;

  SchoolInformationModel(
      {required this.classStart,
        required this.aysem,
        required this.userid,
      });

  factory SchoolInformationModel.fromJson(Map<String, dynamic> json) {
    return SchoolInformationModel(
      classStart: json["classStart"] ?? "",
      aysem: json["aysem"] ?? "",
      userid: json["userid"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'classStart': classStart.trim(),
      'aysem': aysem.trim(),
      'userid': userid.trim(),
    };
    return map;
  }
}

//get AmtDue
class AmountDueResponseModel {
  final String amtDue ;


  AmountDueResponseModel(
      {required this.amtDue,
      });

  factory AmountDueResponseModel.fromJson(Map<String, dynamic> json) {
    return AmountDueResponseModel(
      amtDue: json["amtDue"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'amtDue': amtDue.trim(),
    };
    return map;
  }
}
// ---------------------------------------------------------------------------
// SCHEDULE RESPONSE MODEL
class ScheduleResponseModel {
  String classId;
  String classCode;
  String subject;
  String section;
  String schedule;
  String units;
  String faculty; // Added faculty field

  ScheduleResponseModel({
    required this.classId,
    required this.classCode,
    required this.subject,
    required this.section,
    required this.schedule,
    required this.units,
    required this.faculty, // Initialize faculty field
  });

  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) {
    return ScheduleResponseModel(
      classId: json['classid'] != null ? json["classid"] : "",
      classCode: json['classCode'] != null ? json["classCode"] : "",
      subject: json['subject'] != null ? json["subject"] : "",
      section: json['section'] != null ? json["section"] : "",
      schedule: json['schedule'] != null ? json["schedule"] : "",
      units: json['units'] != null ? json["units"] : "",
      faculty: json['faculty'] != null ? json["faculty"] : "",
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'classId': classId.trim(),
      'classCode': classCode.trim(),
      'subject': subject.trim(),
      'section': section.trim(),
      'schedule': schedule.trim(),
      'units': units.trim(),
    };
    return map;
  }

}


// ---------------------------------------------------------------------------
// FEES RESPONSE MODEL
class FeesResponseModel {
  String itemName;
  String itemAmount;

  FeesResponseModel({
    required this.itemName,
    required this.itemAmount,
  });

  factory FeesResponseModel.fromJson(Map<String, dynamic> json) {
    return FeesResponseModel(
      itemName: json['itemName'] != null ? json["itemName"] : "",
      itemAmount: json['itemAmount'] != null ? json["itemAmount"].toString() : "",
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'itemName': itemName.trim(),
      'itemAmount': itemAmount.trim(),
    };
    return map;
  }

}

// ---------------------------------------------------------------------------
// STUDENT PERSONAL INFORMATION RESPONSE MODEL
class UserPersonalResponseModel {
  // final String detail;
  final String firstname;
  final String lastname;
  final String middlename;
  final String pedigree;
  final String gender;
  final String civilstatus;
  final String citizenship;
  final String email;
  final String mobilephone;
  final String role;

  UserPersonalResponseModel({
    //  required this.detail,
    required this.firstname,
    required this.lastname,
    required this.middlename,
    required this.pedigree,
    required this.gender,
    required this.civilstatus,
    required this.citizenship,
    required this.email,
    required this.mobilephone,
    required this.role,
  });

  factory UserPersonalResponseModel.fromJson(Map<String, dynamic> json) {
    return UserPersonalResponseModel(
      firstname: json['firstname'] != null ? json["firstname"] : "",
      lastname: json['lastname'] != null ? json["lastname"] : "",
      middlename: json['middlename'] != null ? json["middlename"] : "",
      pedigree: json['pedigree'] != null ? json["pedigree"] : "",
      gender: json['gender'] != null ? json["gender"] : "",
      civilstatus: json['civilstatus'] != null ? json["civilstatus"] : "",
      citizenship: json["citizenshipcid"] ?? "",
      email: json["email"] ?? "",
      mobilephone: json["mobilephone"] ?? "",
      role: json["role"] ?? "",
      //  detail: json["detail"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'firstname': firstname.trim(),
      'lastname': lastname.trim(),
      'middlename': middlename.trim(),
      'pedigree': pedigree.trim(),
      'gender': gender.trim(),
      'civilstatus': civilstatus.trim(),
      'citizenship': citizenship.trim(),
      'email': email.trim(),
      'mobilephone': mobilephone.trim(),
      'role': role.trim(),
    };
    return map;
  }
}

// ---------------------------------------------------------------------------
// STUDENT SCHOOL INFORMATION RESPONSE MODEL
class UserSchoolResponseModel {
  final String detail;
  final String studId;
  final String studentType;
  final String regCode;
  final String progTitle;
  final String yearLevel;
  final String plmemail;

  UserSchoolResponseModel(
      {required this.detail,
        required this.studId,
        required this.studentType,
        required this.regCode,
        required this.progTitle,
        required this.yearLevel,
        required this.plmemail});

  factory UserSchoolResponseModel.fromJson(Map<String, dynamic> json) {
    return UserSchoolResponseModel(
      studId: json['studentId']?.toString() ?? "",
      studentType: json['studentType']?.toString() ?? "",
      regCode: json['regCode']?.toString() ?? "",
      progTitle: json['progTitle']?.toString() ?? "",
      yearLevel: json['yearLevel']?.toString() ?? "",
      plmemail: json['plmemail']?.toString() ?? "",
      detail: json["detail"]?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentId': studId.trim(),
      'detail': detail.trim(),
      'studentType': studentType.trim(),
      'yearLevel': yearLevel.trim(),
      'regCode': regCode.trim(),
      'progTitle': progTitle.trim(),
      'plmemail': plmemail.trim(),
    };
  }
}