// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/button.dart';

class EditDetailsPage extends StatefulWidget {
  const EditDetailsPage({super.key});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  Future<bool> exitConfirm() async {
    return await showDialog(
          barrierDismissible: false,
          useRootNavigator: false,
          context: context,
          builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: const Text('Cancel Update Details'),
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
          appBar: AppBar(
            title: const Text("Update Account"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Column(
                    children: [
                      Text("Juan Dela Cruz",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child:
                            Text("2021-12345", style: TextStyle(fontSize: 14)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text("jdelacruz2021@plm.edu.ph",
                            style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Update Your Contact Details",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff006699))),
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text("Personal Email",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextFormField(
                              controller: _controller1,
                              decoration: const InputDecoration(
                                  hintText: "someone@domain.com", // Maybe the user's current email instead?
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder()),
                              onSaved: (String? value) {
                                // To be followed
                                // assign value to be saved in DB
                              },
                              validator: (String? value) {
                                return null;

                                // To be followed
                                // Must not be the current email, must be a valid email.
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text("Mobile Number",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextFormField(
                              controller: _controller2,
                              decoration: const InputDecoration(
                                  hintText: "09XX XXX XXXX", // Maybe the user's current number instead?
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder()),
                              onSaved: (String? value) {
                                // To be followed
                                // assign value to be saved in DB
                              },
                              validator: (String? value) {
                                return null;

                                // To be followed
                                // Must not be the current contact number, must be a valid contact number.
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonFill(
                        buttonText: 'Update Details',
                        onPressed: () {
                          if (_controller1.text == Null && _controller2.text == Null){
                            // Notify the user that nothing has been updated. Or notify that to update, there must be values in either fields
                          }
                          else if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Validated the values. Update values in database and indicate to user that values are updated.
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
