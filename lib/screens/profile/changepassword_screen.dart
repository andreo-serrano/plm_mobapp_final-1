// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../utils/constants.dart';
import '../../widgets/button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var checkboxsize = 0.7;
  CheckPasswordStrength passwordstrengthchecker = CheckPasswordStrength();
  bool curpasswordVisible = false;
  bool newpasswordVisible = false;
  bool conpasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  Widget createGuideline(
    double checkboxsize,
    bool boxstatus,
    String labeltext,
  ) {
    return Row(
      children: [
        Transform.scale(
          scale: checkboxsize,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            isError: true,
            value: boxstatus,
            activeColor: const Color(0xFF23a27a),
            checkColor: const Color(0xFF23a27a),
            onChanged: (value) {
              null;
            },
          ),
        ),
        boxstatus
            ? Text(labeltext,
                style: const TextStyle(fontSize: 13, color: Color(0xFF23a27a)))
            : Text(labeltext,
                style: const TextStyle(fontSize: 13, color: Color(0xFFA31920)))
      ],
    );
  }

  Widget buildStrongPasswordWidget() {
    return Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20, bottom: 70),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.withOpacity(0.1)),
        child: const Padding(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Icon(Icons.check_circle, color: Color(0xFF23a27a), size: 16),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Your password is strong.",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF23a27a))),
                  ),
                ],
              ),
            ])));
  }

  Widget buildWeakPasswordWidget() {
    return Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20, bottom: 70),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red.withOpacity(0.1)),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(
                children: [
                  Icon(Icons.warning, color: Color(0xFFA31920), size: 16),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Your new password is not strong enough.",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA31920))),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("The password must be: ",
                  style: TextStyle(fontSize: 13, color: Color(0xFFA31920))),
              createGuideline(checkboxsize, passwordstrengthchecker.iseightlong,
                  'At least eight characters long.'),
              const SizedBox(
                height: 5,
              ),
              const Text("The password must have: ",
                  style: TextStyle(fontSize: 13, color: Color(0xFFA31920))),
              createGuideline(checkboxsize, passwordstrengthchecker.hasoneupper,
                  'At least one uppercase letter.'),
              createGuideline(checkboxsize, passwordstrengthchecker.hasonelower,
                  'At least one lowercase letter.'),
              createGuideline(checkboxsize,
                  passwordstrengthchecker.hasonenumber, 'At least one number.'),
              createGuideline(
                  checkboxsize,
                  passwordstrengthchecker.hasonespecchar,
                  'At least one special character.'),
            ])));
  }

  Widget createPasswordField(
      String warning,
      String label,
      bool formVisible,
      ValueChanged<bool> onVisibilityChanged,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      onSaved: (String? value) {
        // assign value to be saved in DB
      },
      validator: (value) {
        if (label == "Current Password") {
          if (value == null || value.isEmpty) {
            return warning;
          }
          /*else if (value != password){
          Fetch current password from db to validate if it is the user's current password.
          }*/
          return null;
        } else if (label == "New Password") {
          if (value == null || value.isEmpty) {
            return warning;
          } else if (value == _controller1.text) {
            return "New Password and Current Password are the same";
          } else if (passwordstrengthchecker.isPasswordStrong() == false){
            return "Password does not adhere to guidelines.";
          }
        } else if (label == "Confirm Password") {
          if (value == null || value.isEmpty) {
            return warning;
          } else if (value != _controller2.text) {
            return "New and Confirm Password do not match";
          }
        }
      },
      onChanged: (value) {
        if (label == "New Password") {
          setState(() {
            passwordstrengthchecker.iseightlong =
                passwordstrengthchecker.checkPasswordLength(value);
            passwordstrengthchecker.hasoneupper =
                passwordstrengthchecker.checkPasswordUpper(value);
            passwordstrengthchecker.hasonelower =
                passwordstrengthchecker.checkPasswordLower(value);
            passwordstrengthchecker.hasonenumber =
                passwordstrengthchecker.checkPasswordNumber(value);
            passwordstrengthchecker.hasonespecchar =
                passwordstrengthchecker.checkPasswordSpecial(value);
          });
        }
      },
      obscureText: !formVisible,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
                formVisible ? Icons.visibility : Icons.visibility_off_outlined),
            onPressed: () {
              setState(() {
                onVisibilityChanged(!formVisible);
              });
            },
          ),
          border: const OutlineInputBorder(),
          labelText: label,
          contentPadding: const EdgeInsets.all(8)),
    );
  }

  Future<bool> exitConfirm() async {
    return await showDialog(
          barrierDismissible: false,
          useRootNavigator: false,
          context: context,
          builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: const Text('Cancel Change Password'),
              content: const Text(
                  'Are you sure you want to cancel? Changes might not be saved!'),
              actions: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: ButtonFill(
                        buttonText: 'No',
                        onPressed: () => Navigator.pop(context),
                        bgColor: Colors.grey.shade200,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: ButtonFill(
                        buttonText: 'Yes',
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        bgColor: error,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitConfirm,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA31920)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  RichText(
                    text: const TextSpan(
                        text: 'Don’t forget your password. In order to ',
                        style: TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                        children: [
                          TextSpan(
                            text: 'protect your account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: ', make sure your new password:',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: RichText(
                      text: const TextSpan(
                        text: '\u2022 Be at least ',
                        style: TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                        children: [
                          TextSpan(
                            text: '8 characters in length.\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: '\u2022 Contains both ',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'Uppercase ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'and ',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'Lowercase ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'alphabetic \n',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: '  characters (e.g. A-Z, a-z). \n',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: '\u2022 Have at least ',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'one numerical character ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'e.g (0-9) \n',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: '\u2022 Have at least ',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'one special character',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: ' (e.g. ~!@#\$%^*\n',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: '  ()_-+=)\n',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: '\u2022 Does ',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'not include ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'elements of your ',
                            style:
                                TextStyle(color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                          TextSpan(
                            text: 'username.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 5, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      createPasswordField('Please enter current password',
                          'Current Password', curpasswordVisible, (value) {
                        setState(() {
                          curpasswordVisible = value;
                        });
                      }, _controller1),
                      const SizedBox(height: 15),
                      createPasswordField('Please enter new password',
                          'New Password', newpasswordVisible, (value) {
                        setState(() {
                          newpasswordVisible = value;
                        });
                      }, _controller2),
                      const SizedBox(height: 15),
                      createPasswordField('Please confirm new password',
                          'Confirm Password', conpasswordVisible, (value) {
                        setState(() {
                          conpasswordVisible = value;
                        });
                      }, _controller3),
                    ],
                  ),
                ),
                passwordstrengthchecker.showDialog
                    ? (passwordstrengthchecker.isPasswordStrong()
                        ? buildStrongPasswordWidget()
                        : buildWeakPasswordWidget())
                    : Container()
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
          child: ButtonFill(
            buttonText: 'Update Password',
            onPressed: () {
              if (passwordstrengthchecker.isPasswordStrong() == false &&
                 (_controller2.text == _controller3.text && _controller2.text != "")) {
                setState(() {
                  passwordstrengthchecker.showDialog = true;
                });
                // Indicate to user that password isn't strong enough.
              }

              if (_formKey.currentState!.validate() && passwordstrengthchecker.isPasswordStrong() == true) {
                _formKey.currentState!.save();
                // Validated the values. Update value in database and indicate to user that password is updated.
              }
              
            },
          ),
        ),
      ),
    );
  }
}

class CheckPasswordStrength {
  bool iseightlong = false;
  bool hasoneupper = false;
  bool hasonelower = false;
  bool hasonenumber = false;
  bool hasonespecchar = false;
  bool passwordIsStrong = false;
  bool showDialog = false;

  bool checkPasswordLength(String password) {
    if (password.length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPasswordUpper(String password) {
    if (password.contains(RegExp(r'[A-Z]'))) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPasswordLower(String password) {
    if (password.contains(RegExp(r'[a-z]'))) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPasswordNumber(String password) {
    if (password.contains(RegExp(r'[0-9]'))) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPasswordSpecial(String password) {
    if (password.contains(RegExp(r'[~!@#\$%^&*()_+\-=\[\]{};:\\|,.<>\/?]'))) {
      return true;
    } else {
      return false;
    }
  }

  bool isPasswordStrong() {
    if (iseightlong == true &&
        hasonelower == true &&
        hasonenumber == true &&
        hasonespecchar == true &&
        hasoneupper == true) {
      return true;
    } else {
      return false;
    }
  }
}
