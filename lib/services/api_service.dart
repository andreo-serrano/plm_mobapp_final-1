import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/grades_model.dart';
import '../model/sfemodel/sfe_question_model.dart';
import '../model/student_model.dart';
import '../model/login_model.dart';
import '../model/news_model.dart';
import '../model/request.dart';

import '../model/sfemodel/eval_list_model.dart';

class APIService {
  String apiUrl = "https://plmmobapi.000webhostapp.com/mobileApp2";
  String oldApiUrl = "https://flushed-establishme.000webhostapp.com";
  String sfeApiUrl = "http://192.168.56.1/SFE";

  Future<List<News>> fetchNews() async {
    print('fetchNews function called!');
    var url = "${apiUrl}/getNews.php";
    final storage = new FlutterSecureStorage();
    final userId = await storage.read(key: 'userid');
    var body = {'username': userId, 'role': 'student'};
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(body),
    );
    print("DEBUG GENERAL NEWS: ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 403) {
      List<News>? news = [];
      var isSet = 0;
      for (var item in json.decode(response.body)) {
        News currNews = News.fromJson(item);
        if (currNews.enteredOn.isBefore(DateTime.now()) &&
            currNews.validUntil.isAfter(DateTime.now())) {
          news.add(currNews);
          isSet = 1;
        }
      }
      if (isSet == 0) {
        news = null;
      }
      return news!;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<List<StudentNews>> fetchStudentNews() async {
    print('fetchStudentNews function called!');
    var url = "${apiUrl}/getNewsInternal.php";
    final storage = new FlutterSecureStorage();
    final userId = await storage.read(key: 'userid');
    var body = {'username': userId, 'role': 'student'};
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(body),
    );
    print("DEBUG INTERNAL NEWS: ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 403) {
      List<StudentNews>? studentNews = [];
      var isSet = 0;
      for (var item in json.decode(response.body)) {
        StudentNews currNews = StudentNews.fromJson(item);
        if (currNews.announceStart.isBefore(DateTime.now()) &&
            currNews.validUntil.isAfter(DateTime.now())) {
          studentNews.add(currNews);
          isSet = 1;
        }
      }
      if (isSet == 0) {
        studentNews = null;
      }
      return studentNews!;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<LoginResponseModel> login(
      LoginRequestModel requestModel, String username, String password) async {
    final storage = new FlutterSecureStorage();
    var url = "$apiUrl/login.php"; // the url of the API
    print("Fetching login from API!!"); // debug

    // Store User Password
    await UserSecureStorage.setUserPassword(password);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
          'Accept': "application/json"
        },
        body: json.encode({'username': username, 'password': password}),
        encoding: Encoding.getByName("utf-8"),
      );

      print('Response Body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 403) {
        final responseBody = json.decode(response.body);
        final accessToken = responseBody['access_token'];
        final userId = responseBody['userid'];
        final role = responseBody['role'];
        final mailnickname = responseBody['mailnickname'];
        final studentid = responseBody['studentid'];

        // Update user storage
        await UserSecureStorage.setUserToken(accessToken);
        await UserSecureStorage.setUserId(userId.toString());
        await UserSecureStorage.setUserRole(role);
        await UserSecureStorage.setName(mailnickname);
        await UserSecureStorage.setStudentId(studentid.toString());

        // Print statements for debugging
        print('Access Token: $accessToken');
        print('User ID: $userId');
        print('User Role: $role');
        print('Mailnickname: $mailnickname');
        print('Student ID: $studentid');

        return LoginResponseModel.fromJson(responseBody);
      } else {
        throw Exception(
            'Failed to load data! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception(
          'Failed to connect to the server. Please try again later.');
    }
  }


  // Future<LoginResponseModel> login(
  //     LoginRequestModel requestModel, username, password) async {
  //   final storage = new FlutterSecureStorage();
  //   var url = "${apiUrl}/login.php";
  //   print("nag load yung api");
  //
  //   var body = {'username': username, 'password': password};
  //   final response = await http.post(Uri.parse(url),
  //       headers: {
  //         'Content-Type': "application/json",
  //         'Accept': "application/json"
  //       },
  //       body: json.encode(body),
  //       encoding: Encoding.getByName("utf-8"));
  //
  //   if (response.statusCode == 200 || response.statusCode == 403) {
  //     print("contacted the api");
  //     await storage.write(
  //         key: "access_token",
  //         value: json.decode(response.body)['access_token']);
  //     await UserSecureStorage.setUserToken(
  //         json.decode(response.body)['access_token']);
  //     await UserSecureStorage.setUserId(username);
  //     // await UserSecureStorage.setYearLevel(
  //     //     json.decode(response.body)['yearlevel'].toString());
  //     // print('DEBUG: userRole: ${json.decode(response.body)['role']}');
  //     return LoginResponseModel.fromJson(
  //       json.decode(response.body),
  //     );
  //   } else {
  //     throw Exception('Failed to load data!');
  //   }
  // }

  Future<void> savePE(PEId, username) async {
    print('fetching savePE function');
    final storage = new FlutterSecureStorage();
    var url = "${apiUrl}/savePE.php";
    var body = {'PEId': PEId, 'username': username};
    print('save pe');
    print(PEId);
    print(username);
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
          'Accept': "application/json"
        },
        body: json.encode(body),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200 || response.statusCode == 403) {
      return null;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<void> updateUserContact(String studentId, String email, String mobilePhone) async {
    final storage = new FlutterSecureStorage();
    var url = "$apiUrl/UpdateDetails.php"; // the url of the API

    print("Updating Details from API!!"); 
    print("StudentID : $studentId");
    print("email : $email");
    print("mobilePhone : $mobilePhone");
    
    // debug
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
          'Accept': "application/json"
        },
        body: json.encode({'studentid': studentId, 'email': email, 'mobilephone': mobilePhone,}),
        encoding: Encoding.getByName("utf-8"),
      );

      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(responseData);
        
        if (responseData['success']) {
          print("Update User Contact successful");
        } else {
          print("Failed to update User Contact: ${responseData['message']}");
        }
      } else {
        print("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error Updating User Contact: $e');
      throw Exception(
          'Failed to connect to the server. Please try again later.');
      }
  }

  Future<void> updateUserPassword(String studentId, String password) async {
    final storage = new FlutterSecureStorage();
    var url = "$apiUrl/UpdatePassword.php"; // the url of the API

    print("Updating Password from API!!"); 
    print("StudentID : $studentId");
    print("password : $password");
    
    // debug
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
          'Accept': "application/json"
        },
        body: json.encode({'studentid': studentId, 'password': password}),
        encoding: Encoding.getByName("utf-8"),
      );

      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(responseData);
        
        if (responseData['success']) {
          print("Update User Password successful");
        } else {
          print("Failed to update User Password: ${responseData['message']}");
        }
      } else {
        print("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error Updating User Password: $e');
      throw Exception(
          'Failed to connect to the server. Please try again later.');
      }
  }


  Future<UserResponseModel> user() async {
    print('User function called!');

    final storage = new FlutterSecureStorage();
    final studentid = await storage.read(key: 'studentid') ?? '';
    final role = await storage.read(key: 'role') ?? '';
    final accessToken = await storage.read(key: 'access_token') ?? '';

    if (studentid.isEmpty || role.isEmpty || accessToken.isEmpty) {
      print('Missing required fields:');
      print('studentid: $studentid');
      print('role: $role');
      print('access_token: $accessToken');
      throw Exception('Missing required fields for user!');
    }

    final url = "$apiUrl/userPersonal.php";
    var body = {
      'studentid': studentid,
      'role': role,
      'access_token': accessToken
    };

    // Debugging: Print request details
    print('Making request to $url with body: $body');

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(body),
        encoding: Encoding.getByName("utf-8"),
      );

      // Debugging: Print response details
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 403) {
        final responseBody = json.decode(response.body);

        // Debugging: Print parsed response data
        print('Parsed JSON Data: $responseBody');

        final studentid = responseBody['studentid'];
        final firstName = responseBody['firstname'];
        final lastName = responseBody['lastname'];

        // Update user storage
        await UserSecureStorage.setStudentId(studentid.toString());
        await UserSecureStorage.setFirstName(firstName);
        await UserSecureStorage.setLastName(lastName);

        print('Student ID: $studentid');
        print('First Name: $firstName');
        print('Last Name: $lastName');

        return UserResponseModel.fromJson(responseBody);
      } else {
        print('Failed to load data! Status Code: ${response.statusCode}');
        throw Exception(
            'Failed to load data! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception(
          'Failed to connect to the server. Please try again later.');
    }
  }

  Future<UserPersonalResponseModel> personal() async {
    print('Response function called!');

    final storage = new FlutterSecureStorage();
    final studentid = await storage.read(key: 'studentid') ?? '';
    final role = await storage.read(key: 'role') ?? '';
    final accessToken = await storage.read(key: 'access_token') ?? '';

    if (studentid.isEmpty || role.isEmpty || accessToken.isEmpty) {
      print('Missing required fields:');
      print('studentid: $studentid');
      print('role: $role');
      print('access_token: $accessToken');
      throw Exception('Missing required fields');
    }

    String url = "$apiUrl/userPersonal.php";
    var body = {
      'studentid': studentid,
      'role': role,
      'access_token': accessToken
    };

    // Debugging: Print request details
    print('Making request to $url with body: $body');

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(body),
        encoding: Encoding.getByName("utf-8"),
      );

      // Debugging: Print response details
      print('Response Status Code: ${response.statusCode}');
      print('Response Body for userpersonalresponse: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 403) {
        final jsonData = jsonDecode(response.body);

        // Debugging: Print parsed response data
        print('Parsed JSON Data: $jsonData');

        return UserPersonalResponseModel.fromJson(jsonData);
      } else {
        print('Failed to load data! Status Code: ${response.statusCode}');
        throw Exception(
            'Failed to load data! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception(
          'Failed to connect to the server. Please try again later.');
    }
  }

  Future<UserSchoolResponseModel> school() async {
    print('School function called!');
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'access_token');
    final studentid = await storage.read(key: 'studentid') ?? '';
    // Ensure studentid is correct
    print('Fetched student ID: $studentid');

    String url = "${apiUrl}/userSchool.php";
    var body = {'studentid': studentid, 'role': 'student'};

    print('Making request to $url with body: $body'); // Debugging

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(body),
      encoding: Encoding.getByName("utf-8"),
    );

    print('Response Status Code: ${response.statusCode}'); // Debugging
    print('Response Body: ${response.body}'); // Debugging

    if (response.statusCode == 200 || response.statusCode == 403) {
      final jsonData = jsonDecode(response.body);
      print('Parsed JSON Data: $jsonData'); // Debugging
      return UserSchoolResponseModel.fromJson(jsonData);
    } else {
      print(
          'Failed to load data! Status Code: ${response.statusCode}'); // Debugging
      throw Exception('Failed to load data!');
    }
  }

  Future<SchoolInformationModel> schoolInfo() async {
    final storage = new FlutterSecureStorage();
    String url = "${apiUrl}/schoolInformation.php";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200 || response.statusCode == 403) {
      await UserSecureStorage.setClassStart(
          json.decode(response.body)['classStart']);
      await UserSecureStorage.setAysem(json.decode(response.body)['aysem']);
      final jsonData = jsonDecode(response.body);
      return SchoolInformationModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<AmountDueResponseModel> AmtDueInfo() async {
    final storage = new FlutterSecureStorage();
    String url = "${apiUrl}/getAmtDue.php";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200 || response.statusCode == 403) {
      await UserSecureStorage.setAmtDue(json.decode(response.body)['amtDue']);
      final jsonData = jsonDecode(response.body);
      return AmountDueResponseModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<List<YearTerm>> getYearTerms() async {
    final storage = new FlutterSecureStorage();
    final token = await storage.read(key: 'access_token');
    final userId = await storage.read(key: 'userid');
    String url = "${apiUrl}/grades.php";
    var body = {'username': userId, 'role': 'student'};
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
        encoding: Encoding.getByName("utf-8"));
    if (response.statusCode == 200 || response.statusCode == 403) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<YearTerm> yearTerms =
          jsonData.map((yearTerm) => YearTerm.fromJson(yearTerm)).toList();
      return yearTerms;
    } else {
      throw Exception('Failed to load year terms');
    }
  }

  Future<List<PEList>> getPEList() async {
    final storage = new FlutterSecureStorage();
    final token = await storage.read(key: 'access_token');
    final userId = await storage.read(key: 'userid');
    String url = "${apiUrl}/enrollPEList.php";
    var body = {'username': userId, 'role': 'student'};
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
        encoding: Encoding.getByName("utf-8"));
    if (response.statusCode == 200 || response.statusCode == 403) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<PEList> peLists =
          jsonData.map((peList) => PEList.fromJson(peList)).toList();
      return peLists;
    } else {
      throw Exception('Failed to load PE');
    }
  }

  Future<List<ScheduleResponseModel>> fetchClasses() async {
    final storage = new FlutterSecureStorage();
    final token = await storage.read(key: 'access_token');
    final userId = await storage.read(key: 'userid');
    String url = '${apiUrl}/enrollStep1Test.php';
    var body = {'username': userId, 'role': 'student'};
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
      encoding: Encoding.getByName("utf-8"),
    );

    List<ScheduleResponseModel>? schedule = [];
    if (response.statusCode == 200 || response.statusCode == 403) {
      for (var item in json.decode(response.body)) {
        ScheduleResponseModel sched = ScheduleResponseModel.fromJson(item);
        schedule.add(sched);
      }
      return schedule;
    } else {
      return schedule;
    }
  }

  Future<List<FeesResponseModel>> fetchFees() async {
    final storage = new FlutterSecureStorage();
    final token = await storage.read(key: 'access_token');
    final userId = await storage.read(key: 'userid');
    String url = '${apiUrl}/enrollStep2.php';
    var body = {'username': userId, 'role': 'student'};
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
      encoding: Encoding.getByName("utf-8"),
    );

    List<FeesResponseModel>? fees = [];
    if (response.statusCode == 200 || response.statusCode == 403) {
      for (var item in json.decode(response.body)) {
        await UserSecureStorage.setItem(
            json.decode(response.body)[0]['itemName']);
        FeesResponseModel fee = FeesResponseModel.fromJson(item);
        fees.add(fee);
      }
      return fees;
    } else {
      return fees;
    }
  }

  Future<List<SFEQuestionModel>> fetchSFEQuestion() async {
    var url = "${sfeApiUrl}";
    print("DEBUG SFE NEWS: ${url}");
    final response = await http.get(Uri.parse(url));
    List<SFEQuestionModel> questionlist = [];
    // log("SFE RESPONSE BODY ${json.decode(response.body)}");
    // print("SFE RESPONSE BODY ${json.decode(response.body)}");

    for (var item in json.decode(response.body)) {
      SFEQuestionModel currQuestion = SFEQuestionModel.fromJson(item);
      questionlist.add(currQuestion);
    }
    return questionlist;
  }

  Future<EvaluationListModel> submitEval(
      EvaluationListModel evaluationListModel) async {
    var url = Uri.parse("${sfeApiUrl}/postdata.php");

    var data = {
      "studentid": evaluationListModel.studentId.toString(),
      "classid": evaluationListModel.classId.toString(),
      "facultyid": evaluationListModel.facultyId.toString(),
      "updatedon": evaluationListModel.updatedOn.toString(),
      "fromdb": evaluationListModel.fromDb,
      "I-1": evaluationListModel.i1.toString(),
      "I-2": evaluationListModel.i2.toString(),
      "I-3": evaluationListModel.i3.toString(),
      "I-4": evaluationListModel.i4.toString(),
      "I-5": evaluationListModel.i5.toString(),
      "I-6": evaluationListModel.i6.toString(),
      "I-7": evaluationListModel.i7.toString(),
      "I-8": evaluationListModel.i8.toString(),
      "I-9": evaluationListModel.i9.toString(),
      "I-10": evaluationListModel.i10.toString(),
      "I-11": evaluationListModel.i11.toString(),
      "I-12": evaluationListModel.i12.toString(),
      "I-13": evaluationListModel.i13.toString(),
      "I-14": evaluationListModel.i14.toString(),
      "I-15": evaluationListModel.i15.toString(),
      "I-16": evaluationListModel.i16.toString(),
      "I-17": evaluationListModel.i17.toString(),
      "I-18": evaluationListModel.i18.toString(),
      "I-19": evaluationListModel.i19.toString(),
      "I-20": evaluationListModel.i20.toString(),
      "I-21": evaluationListModel.i21.toString(),
      "I-22": evaluationListModel.i22.toString(),
      "I-23": evaluationListModel.i23.toString(),
      "I-24": evaluationListModel.i24.toString(),
      "I-25": evaluationListModel.i25.toString(),
      "I-26": evaluationListModel.i26.toString(),
      "I-27": evaluationListModel.i27.toString(),
      "I-28": evaluationListModel.i28.toString(),
      "I-29": evaluationListModel.i29.toString(),
      "I-30": evaluationListModel.i30.toString(),
      "I-31": evaluationListModel.i31.toString(),
      "I-32": evaluationListModel.i32.toString(),
      "I-33": evaluationListModel.i33.toString(),
      "I-34": evaluationListModel.i34.toString(),
      "I-35": evaluationListModel.i35.toString(),
      "I-36": evaluationListModel.i36.toString(),
      "I-37": evaluationListModel.i37.toString(),
      "I-38": evaluationListModel.i38.toString(),
      "I-39": evaluationListModel.i39.toString(),
      "I-40": evaluationListModel.i40.toString(),
      "I-41_1": evaluationListModel.i411.toString(),
      "I-41_2": evaluationListModel.i412.toString(),
      "I-41_3": evaluationListModel.i413.toString(),
      "I-41_4": evaluationListModel.i414.toString(),
      "I-41_5": evaluationListModel.i415.toString(),
      "I-41_6": evaluationListModel.i416.toString(),
      "I-41_7": evaluationListModel.i417.toString(),
      "I-41_8": evaluationListModel.i418.toString(),
      "I-42": evaluationListModel.i42.toString(),
      "I-43": evaluationListModel.i43.toString(),
      "I-44": evaluationListModel.i44.toString(),
      "I-45": evaluationListModel.i45.toString(),
      "I-46": evaluationListModel.i46.toString(),
      "I-47": evaluationListModel.i47.toString(),
      "I-48": evaluationListModel.i48.toString(),
      "I-49": evaluationListModel.i49.toString(),
      "II-1": evaluationListModel.ii1.toString(),
      "II-2": evaluationListModel.ii2.toString(),
      "II-3": evaluationListModel.ii3.toString(),
      "II-4": evaluationListModel.ii4.toString(),
      "II-5": evaluationListModel.ii5.toString(),
      "II-6": evaluationListModel.ii6.toString(),
      "II-7": evaluationListModel.ii7.toString(),
      "II-8": evaluationListModel.ii8.toString(),
      "II-9": evaluationListModel.ii9.toString(),
      "II-10": evaluationListModel.ii10.toString(),
      "II-11": evaluationListModel.ii11.toString(),
      "II-12": evaluationListModel.ii12.toString(),
      "II-13": evaluationListModel.ii13.toString(),
      "II-14": evaluationListModel.ii14.toString(),
      "II-15": evaluationListModel.ii15.toString(),
      "II-16": evaluationListModel.ii16.toString(),
      "III-1": evaluationListModel.iii1.toString(),
      "III-2": evaluationListModel.iii2.toString(),
      "III-3": evaluationListModel.iii3.toString(),
      "III-4": evaluationListModel.iii4.toString(),
      "III-5": evaluationListModel.iii5.toString(),
      "III-6": evaluationListModel.iii6.toString(),
      "III-7": evaluationListModel.iii7.toString(),
      "III-8": evaluationListModel.iii8.toString(),
      "III-9": evaluationListModel.iii9.toString(),
      "III-10": evaluationListModel.iii10.toString(),
    };

    // Send the POST request
    final response = await http.post(
      url,
      body: json.encode(data),
    );
    var jsonResponse = jsonDecode(json.encode(data));
    var evaluationList = EvaluationListModel.fromJson(jsonResponse);
    print("SFE SUBMIT URL ${url}");
    print("SFE DATA${data}");
    print("SFE JSON ENCODE${json.encode(response.body)}");
    print("SFE JSON DECODE${jsonResponse}");
    // print("SFE JSON RESPONSE${evaluationList}");
    return evaluationList;

    //
    // return evaluationListModel;
  }

  Future<void> pushDocumentRequest(
      String student_number,
      String email,
      String program,
      String college,
      int year,
      int block,
      String documentRequested) async {
    var url = "$apiUrl/postDocumentRequest.php"; // the url of the API

    // debug
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
          'Accept': "application/json"
        },
        body: json.encode({
          'student_number': student_number,
          'email': email,
          'program': program,
          'college': college,
          'year': year,
          'block': block,
          'document_requested': documentRequested
        }),
        encoding: Encoding.getByName("utf-8"),
      );

      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(responseData);

        if (responseData['success']) {
          print("Document Request pushed successfully");
        } else {
          print("Document Request push failed: ${responseData['message']}");
        }
      } else {
        print("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error pushing document request: $e');
      throw Exception(
          'Failed to connect to the server. Please try again later.');
    }
  }
}
