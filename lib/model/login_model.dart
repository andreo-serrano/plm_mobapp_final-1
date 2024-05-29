// ignore_for_file: non_constant_identifier_names

class LoginResponseModel {
  final String access_token;
  final String token_type;
  final String role;

  LoginResponseModel(
      {required this.access_token,
      required this.token_type,
      required this.role});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      access_token: json["access_token"] ?? "",
      token_type: json["token_type"] ?? "",
      role: json["role"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'access_token': access_token.trim(),
      'token_type': token_type.trim(),
      'role': role.trim(),
    };
    return map;
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username,
      'password': password.trim(),
    };
    return map;
  }
}
