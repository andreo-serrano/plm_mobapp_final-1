
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/api_service.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> setUserToken(String token) async =>
      await _storage.write(key: "access_token", value: token);

  static Future<String?> getUserToken() async =>
      await _storage.read(key: "access_token");

  static Future<void> setUserName(String username) async =>
      await _storage.write(key: "username", value: username);

  static Future<String?> getUserName() async =>
      await _storage.read(key: "username");

  static Future<void> setUserPassword(String password) async =>
      await _storage.write(key: "password", value: password);

  static Future<String?> getUserPassword() async =>
      await _storage.read(key: "password");

  static Future<void> setFirstName(String firstName) async =>
      await _storage.write(key: 'firstname', value: firstName);

  static Future<String?> getFirstName() async =>
      await _storage.read(key: 'firstname');

  static Future<void> setClassStart(String classStart) async =>
      await _storage.write(key: "classStart", value: classStart);

  static Future<String?> getClassStart() async =>
      await _storage.read(key: "classStart");

  static Future<void> setAysem(String aysem) async =>
      await _storage.write(key: "aysem", value: aysem);

  static Future<String?> getAysem() async =>
      await _storage.read(key: "aysem");

  static Future<void> setItem(String itemName) async =>
      await _storage.write(key: "itemName", value: itemName);

  static Future<String?> getItem() async =>
      await _storage.read(key: "itemName");

  static Future<void> setAmtDue(String amtDue) async =>
      await _storage.write(key: "amtDue", value: amtDue);

  static Future<String?> getAmtDue() async =>
      await _storage.read(key: "amtDue");

  static Future<void> setLastName(String lastname) async =>
      await _storage.write(key: "lastname", value: lastname);

  static Future<String?> getLastName() async =>
      await _storage.read(key: "lastname");

  static Future<void> setUserId(String userid) async =>
      await _storage.write(key: "userid", value: userid);

  static Future<String?> getUserId() async =>
      await _storage.read(key: "userid");

  static Future<void> setStudentId(String studentid) async =>
      await _storage.write(key: "studentid", value: studentid);

  static Future<String?> getStudentId() async =>
      await _storage.read(key: "studentid");

  static Future<void> setName(String mailnickname) async =>
      await _storage.write(key: "mailnickname", value: mailnickname);

  static Future<String>? getName() async =>
      await _storage.read(key: "mailnickname") as String;

  static Future setUserRole(String role) async =>
      await _storage.write(key: "role", value: role);

  static Future setUserEmail(String email) async =>
      await _storage.write(key: "plm_email_address", value: email);

  static Future<String>? getUserEmail() async =>
      await _storage.read(key: "plm_email_address") as String;
  
  static Future<String?> getUserRole() async =>
      await _storage.read(key: "role");

  static Future<void> setGender(String gender) async =>
      await _storage.write(key: "gender", value: gender);

  static Future<String?> getGender() async =>
      await _storage.read(key: "gender");

  static Future<bool> isLogged() async {
    try {
      final user = await _storage.read(key: 'access_token');
      return user != null;
    } catch (e) {
      return false;
    }
  }
}

getStudentInformation() async {
  APIService apiService = APIService();
  apiService.user().then((value) async => {
    await UserSecureStorage.setFirstName(value.firstname),
    await UserSecureStorage.setUserName(value.lastname),
    await UserSecureStorage.setUserEmail(value.email),
  });
}

getSchoolInformation() async {
  APIService apiService = APIService();
  apiService.schoolInfo().then((value) async => {
    await UserSecureStorage.setClassStart(value.classStart),
  });
}

logOut() async {
  const storage = FlutterSecureStorage();
  await storage.deleteAll();
}