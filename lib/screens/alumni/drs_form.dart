import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plmmobileapp_v2/services/api_service.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(DRSPage());
}

class DRSPage extends StatelessWidget {
  const DRSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Document Request",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => StepState()),
            ChangeNotifierProvider(create: (context) => DropdownState()),
          ],
          child: DRSStepper(),
        ),
      ),
    );
  }
}

class StepState extends ChangeNotifier {
  int activeStepIndex = 0;

  void prevStep() {
    activeStepIndex -= 1;
    notifyListeners();
  }

  void nextStep() {
    activeStepIndex += 1;
    notifyListeners();
  }
}

class DropdownState extends ChangeNotifier {
  int? collegeChoice;

  List<String> errors = ["", "", ""];

  bool validateDropdowns(List<String> contents) {
    bool valid = true;
    for (int i = 0; i < 3; i++) {
      if (contents[i].isEmpty) {
        errors[i] = "Please select an item";
        valid = false;
      } else
        errors[i] = "";
    }

    print(errors);
    notifyListeners();

    return valid;
  }
}

class DRSStepper extends StatelessWidget {
  const DRSStepper({super.key});

  @override
  Widget build(BuildContext context) {
    var stepState = context.watch<StepState>();
    int activeStepIndex = stepState.activeStepIndex;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          DRSStepIndicator(activeStepIndex: activeStepIndex),
          SizedBox(height: 20),
          if (activeStepIndex == 0)
            DRSForm()
          else if (activeStepIndex == 1)
            DRSPaymentForm()
          else if (activeStepIndex == 2)
            DRSProcessingPage()
          else if (activeStepIndex == 3)
            DRSDonePage()
        ],
      ),
    );
  }
}

class DRSStepIndicator extends StatelessWidget {
  final int activeStepIndex;
  const DRSStepIndicator({super.key, required this.activeStepIndex});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 12,
              child: Container(
                width: 330,
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StepIcon(
                  icon: Icons.file_open_outlined,
                  name: "Form",
                  active: activeStepIndex >= 0,
                ),
                StepIcon(
                  icon: Icons.credit_card_outlined,
                  name: "Payment",
                  active: activeStepIndex >= 1,
                ),
                StepIcon(
                  icon: Icons.more_horiz_outlined,
                  name: "Processing",
                  active: activeStepIndex >= 2,
                ),
                StepIcon(
                  icon: Icons.check_outlined,
                  name: "Done",
                  active: activeStepIndex >= 3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StepIcon extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool active;
  const StepIcon(
      {super.key,
      required this.icon,
      required this.active,
      required this.name});

  @override
  Widget build(BuildContext context) {
    if (active) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 59, 130, 246),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 7),
          Text(
            name,
            style: TextStyle(
                color: Color.fromARGB(255, 59, 130, 246),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          )
        ],
      );
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1,
              )),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 7),
        Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class DRSForm extends StatefulWidget {
  const DRSForm({super.key});

  @override
  State<DRSForm> createState() => _DRSFormState();
}

class _DRSFormState extends State<DRSForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final studentNumController = TextEditingController();
  final collegeController = TextEditingController();
  final programController = TextEditingController();
  final yearController = TextEditingController();
  final blockController = TextEditingController();
  final documentController = TextEditingController();

  var college_programs = {
    'College of Architecture and Sustainable Built Environments': [
      'Bachelor of Science in Architecture - BS Arch',
    ],
    'College of Education': [
      'Bachelor of Elementary Education (Generalist) - BEEd',
      'Bachelor of Early Childhood Education - BECED',
      'Bachelor of Special Needs Education (Generalist) - BSNEd',
      'Bachelor of Secondary Education Major in English - BSEd-Eng',
      'Bachelor of Secondary Education Major in Filipino - BSEd-Fil',
      'Bachelor of Secondary Education Major in Mathematics - BSEd-Math',
      'Bachelor of Secondary Education Major in Science - BSEd-Sciences',
      'Bachelor of Secondary Education Major in Social Studies - BSED-SS',
      'Bachelor of Physical Education - BPE',
    ],
    'College of Engineering and Technology': [
      'Bachelor of Science in Chemical Engineering - BSCHE',
      'Bachelor of Science in Civil Engineering - BSCE',
      'Bachelor of Science in Computer Engineering - BSCPE',
      'Bachelor of Science in Electrical Engineering - BSEE',
      'Bachelor of Science in Electronics Engineering - BSECE',
      'Bachelor of Science in Manufacturing Engineering - BSMFGE',
      'Bachelor of Science in Mechanical Engineering - BSME',
    ],
    'College of Humanities, Arts, and Social Sciences': [
      'Bachelor of Arts in Communication - BAC',
      'Bachelor of Arts in Communication Major in Public Relations - BAC-PR',
      'Bachelor of Arts in Public Relations - BAPR',
      'Bachelor of Science in Social Work - BSSW',
      'Bachelor of Music in Music Performance - BMMP',
    ],
    'College of Information System and Technology Management': [
      'Bachelor of Science in Computer Science - BSCS',
      'Bachelor of Science in Information Technology - BSIT',
    ],
    'College of Nursing': [
      'Bachelor of Science in Nursing - BSN',
    ],
    'College of Physical Therapy': [
      'Bachelor of Science in Physical Therapy - BSPT',
    ],
    'College of Science': [
      'Bachelor of Science in Biology - BS Bio',
      'Bachelor of Science in Chemistry - BS Chem',
      'Bachelor of Science in Mathematics - BS Math',
      'Bachelor of Science in Psychology - BS PSY',
    ],
    'College of Accountancy': [
      'Bachelor of Science in Accountancy - BS ACCTG',
    ],
    'College of Business Administration': [
      'Bachelor of Science in Business Administration Major in Business Economics - BSBA-BE',
      'Bachelor of Science in Business Administration Major in Financial Management - BSBA-FM',
      'Bachelor of Science in Business Administration Major in Human Resource Development Management - BSBA-HRM',
      'Bachelor of Science in Business Administration Major in Marketing Management - BSBA-MM',
      'Bachelor of Science in Business Administration Major in Operations Management - BSBA-OM',
      'Bachelor of Science in Entrepreneurship - BS-ENTRE',
    ],
    'College of Tourism and Hospitality Management': [
      'Bachelor of Science in Hospitality - BSHM',
      'Bachelor of Science in Real Estate Management - BSREM',
      'Bachelor of Science in Tourism Management - BSTM',
    ],
    'College of Public Administration': [
      'Bachelor of Science in Public Administration',
    ],
  };

  String collegeSelected = "";

  @override
  Widget build(BuildContext context) {
    var stepState = context.watch<StepState>();
    var dropdownState = context.watch<DropdownState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          DRSTextField(
            label: "PLM Email",
            hintText: "name@plm.edu.ph",
            controller: emailController,
            validator: (email) {
              final RegExp emailRegex = RegExp(
                  r'^[a-zA-Z]+[0-9]{4}@plm\.edu\.ph$'); // Regular expression for email validation
              if (!emailRegex.hasMatch(email ?? '')) {
                return 'Please enter a valid PLM e-mail';
              }
              return null;
            },
          ),
          DRSTextField(
            label: "Student Number",
            hintText: "2021-12345",
            controller: studentNumController,
            validator: (num) {
              final RegExp studNumRegex = RegExp(
                  r'^\d{4}-\d{5}$'); // Regular expression for email validation
              if (!studNumRegex.hasMatch(num ?? '')) {
                return 'Please enter a valid student number';
              }
              return null;
            },
          ),
          DRSDropDown(
            label: "College",
            hintText: "Choose your College",
            controller: collegeController,
            dropdownIndex: 0,
            callback: (p0) {
              setState(() {
                collegeSelected = collegeController.text;
                programController.clear();
              });
            },
            entries: [
              for (var college in college_programs.keys)
                DropdownMenuEntry(value: college, label: college),
            ],
          ),
          DRSDropDown(
            label: "Program",
            hintText: "Choose your Program",
            controller: programController,
            dropdownIndex: 1,
            callback: (p0) {},
            entries: [
              if (collegeSelected != "")
                for (var program in college_programs[collegeSelected]!)
                  DropdownMenuEntry(value: program, label: program)
              else
                const DropdownMenuEntry(value: -1, label: "Select a College"),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: DRSTextField(
                  label: "Year",
                  hintText: "1",
                  controller: yearController,
                  validator: (year) {
                    if (!RegExp(r'^[0-9]$').hasMatch(year ?? '')) {
                      return 'Please enter a valid year';
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                child: DRSTextField(
                  label: "Block",
                  hintText: "2",
                  controller: blockController,
                  validator: (block) {
                    if (!RegExp(r'^[0-9]$').hasMatch(block ?? '')) {
                      return 'Please enter a valid block';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          DRSDropDown(
            label: "Document Request",
            hintText: "Select a document",
            controller: documentController,
            dropdownIndex: 2,
            entries: [
              DropdownMenuEntry(value: 0, label: "Transcript of Records"),
              DropdownMenuEntry(
                  value: 1, label: "Transfer Credential (Honorable Dismissal"),
              DropdownMenuEntry(
                  value: 2,
                  label: "Certificate of Graduation in Place of Lost Diploma"),
              DropdownMenuEntry(
                  value: 3, label: "English Translation of Diploma"),
              DropdownMenuEntry(value: 4, label: "CHED/DFA Authentication"),
              DropdownMenuEntry(value: 5, label: "Certification of Grades"),
              DropdownMenuEntry(
                  value: 6,
                  label:
                      "Certified True Copy of Transcript of Records/Diploma"),
              DropdownMenuEntry(value: 7, label: "Course Description(s)"),
              DropdownMenuEntry(value: 8, label: "Certificate of Enrollment"),
              DropdownMenuEntry(
                  value: 9, label: "Certificate of Class Ranking"),
              DropdownMenuEntry(
                  value: 10, label: "Certificate of Non-Availability of ID"),
              DropdownMenuEntry(value: 11, label: "ID Replacement"),
              DropdownMenuEntry(
                  value: 12, label: "Dry Seal of SER/Registration Form"),
              DropdownMenuEntry(
                  value: 13, label: "Certificate of Good Moral Character"),
              DropdownMenuEntry(value: 14, label: "Course Curriculum"),
            ],
          ),
          SizedBox(height: 10),
          DRSSubmitButton(
            text: "Proceed to Payment",
            callback: () async {
              // Validate form
              var contents = [
                collegeController.text,
                programController.text,
                documentController.text,
              ];
              bool valid = true;
              if (!_formKey.currentState!.validate()) {
                valid = false;
              }

              if (!dropdownState.validateDropdowns(contents)) {
                valid = false;
              }

              if (valid) {
                // Insert record to database
                await APIService().pushDocumentRequest(
                  studentNumController.text,
                  emailController.text,
                  programController.text,
                  collegeController.text,
                  int.parse(yearController.text),
                  int.parse(blockController.text),
                  documentController.text,
                );

                stepState.nextStep();
              }
            },
          ),
          SizedBox(height: 10),
          DRSBackButton(),
        ],
      ),
    );
  }
}

class DRSTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const DRSTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Field Label
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: label),
                TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: controller,
            validator: validator,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.red, width: 0),
              ),
              contentPadding: EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }
}

class DRSDropDown extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final List<DropdownMenuEntry> entries;
  final int dropdownIndex;
  final Function(dynamic)? callback;

  const DRSDropDown({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.entries,
    required this.dropdownIndex,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    var error = context.watch<DropdownState>().errors[dropdownIndex];

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Field Label
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: label),
                TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          DropdownMenu(
            controller: controller,
            dropdownMenuEntries: entries,
            hintText: hintText,
            expandedInsets: EdgeInsets.zero,
            errorText: error.isEmpty ? null : error,
            onSelected: callback,
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              contentPadding: EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }
}

class DRSSubmitButton extends StatelessWidget {
  final String text;
  final Function callback;

  const DRSSubmitButton({
    super.key,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 59, 130, 246),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DRSBackButton extends StatelessWidget {
  const DRSBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var stepState = context.watch<StepState>();

    return GestureDetector(
      onTap: () => {
        if (stepState.activeStepIndex == 0)
          {Navigator.of(context, rootNavigator: true).pop(context)}
        else
          {stepState.prevStep()}
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 244, 245),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
          child: Text(
            "Back",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class DRSPaymentForm extends StatelessWidget {
  const DRSPaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    var stepState = context.watch<StepState>();

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mode of Payment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                "Select your payment method below",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 155, 155, 155), width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Text(
                  "Cash",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.grey),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 155, 155, 155), width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Text(
                  "Gcash",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.grey),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 155, 155, 155), width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Text(
                  "Credit / Debit Card",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.grey),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 155, 155, 155), width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Add Card",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        DRSSubmitButton(
          text: "Complete Payment",
          callback: () => stepState.nextStep(),
        ),
        SizedBox(height: 10),
        DRSBackButton(),
      ],
    );
  }
}

class DRSProcessingPage extends StatelessWidget {
  const DRSProcessingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 200),
        Text(
          "Document on Process!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        FractionallySizedBox(
          widthFactor: .8,
          child: Text(
            "Kindly wait for an email to arrive if your document is ready for pick-up.",
            style: TextStyle(fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
        DRSSubmitButton(
          text: "Back to Main Menu",
          callback: () => {Navigator.of(context, rootNavigator: true).pop(context)},
        )
      ],
    );
  }
}

class DRSDonePage extends StatelessWidget {
  const DRSDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 180),
        Icon(
          Icons.check_circle_outline_rounded,
          size: 64,
          color: Colors.green,
        ),
        SizedBox(height: 10),
        Text(
          "Document Request Completed!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        FractionallySizedBox(
          widthFactor: .8,
          child: Text(
            "Your document request has now been successfully processed. ",
            style: TextStyle(fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
        DRSSubmitButton(
          text: "Back to Main Menu",
          callback: () => {Navigator.of(context, rootNavigator: true).pop(context)},
        )
      ],
    );
  }
}
