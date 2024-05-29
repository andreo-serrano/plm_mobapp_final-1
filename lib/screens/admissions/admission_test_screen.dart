// import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/bulletList.dart';
import '../../widgets/button.dart';

import 'admission_plmatresult_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart'; 



//void main() => runApp(const MyApp());

class PlmatScreen extends StatelessWidget {
  const PlmatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PLMAdmissionTestScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/whoMayApply': (context) => const WhoMayApplyScreen(),
        '/applicationProcess': (context) => const ApplicationProcessScreen(),
        '/tuitionFee': (context) => const TuitionFeeScreen(),
        '/plmatResults': (context) => const PlmatResultsScreen(),
        '/applyForPlmat': (context) => const ApplyForPlmatScreen(),
        // Add more routes as needed
      },
    );
  }
}

class WhoMayApplyScreen extends StatelessWidget {
  const WhoMayApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Who May Apply")),
      body: const Center(child: Text("Who May Apply Screen")),
    );
  }
}

class ApplicationProcessScreen extends StatelessWidget {
  const ApplicationProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Application Process")),
      body: const Center(child: Text("Application Process Screen")),
    );
  }
}

class TuitionFeeScreen extends StatelessWidget {
  const TuitionFeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tuition Fee")),
      body: const Center(child: Text("Tuition Fee Screen")),
    );
  }
}

class PlmatResultsScreen extends StatefulWidget {
  const PlmatResultsScreen({super.key});
  @override
  _PlmatResultsScreenState createState() => _PlmatResultsScreenState();
}

class _PlmatResultsScreenState extends State<PlmatResultsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController applicantNumberController = TextEditingController();
  Map<String, bool> contentVisibility = {
    'searchApplicant': false,
  };
   Widget _buildText(String text) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildButton(String contentKey, String text, VoidCallback onPressed, {Color? backgroundColor, TextStyle? textStyle}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.yellow,
        //foregroundColor: const Color.fromRGBO(13, 71, 161, 1),
        textStyle: const TextStyle(fontSize: 16),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        minimumSize: const Size(300, 10), 
      ),
      onPressed: onPressed,
      child: Text(
      text,
      style: textStyle ?? const TextStyle(color: Color.fromRGBO(13, 71, 161, 1), fontWeight: FontWeight.bold),
    ),
    );
  }

  void _toggleContentVisibility(String contentKey) {
    setState(() {
      contentVisibility[contentKey] = !contentVisibility[contentKey]!;
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column( // <-- Use a Column to stack elements vertically
      children: [
        Stack(
          children: [
           ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: SizedBox(
              height: 300,
              child: Stack(
                children: [
                  AvifImage.asset(
                    'assets/images/plm_ad_bg.avif', 
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(255, 9, 134, 211),
                          Colors.transparent,
                        ],
                        stops: [0.1, 5.0], 
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      'PLMAT RESULTS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          
          Positioned(
            top: 10, 
            left: 10,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          ],
        ),
        Expanded( // <-- Make the DraggableScrollableSheet take up the remaining space
          child: DraggableScrollableSheet(
            initialChildSize: 0.9, // Adjust to your desired initial height
            minChildSize: 0.9,     // Minimum size should be the same as initial
            maxChildSize: 1.0,      // Allow full expansion
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'List of Passers',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 126, 23, 16)),
                      ),
                      const SizedBox(height: 20),
                      // Search Functionality
                      const Text("Find your name:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10), 
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your full name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10), 
                      TextField(
                        controller: applicantNumberController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your applicant number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20), 
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            _buildButton('searchApplicant', 'Search Applicant', () => _toggleContentVisibility('searchApplicant'), textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20),
                            if (contentVisibility['searchApplicant']!) ...[
                              const SizedBox(height: 20),
                                const Text(
                                  'CONGRATULATIONS!',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 126, 23, 16)),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Juan Dela Cruz',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 18, 16, 126)),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'We are delighted to inform you that you have been accepted into BS Computer Science at PLM! This is a testament to your talent and potential. We believe that you have a bright future ahead, and we cannot wait to see what you will accomplish as a PLM student. Welcome to the PLM family!'
                                ),
                                const SizedBox(height: 50),
                                const Text(
                                  'REMINDER:',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 126, 23, 16)),
                                ),
                                const Text(
                                  'Kindly wait for the further notice for the next step.'
                                ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
}



class ApplyForPlmatScreen extends StatelessWidget {
  const ApplyForPlmatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apply for PLMAT")),
      body: const Center(child: Text("Apply for PLMAT Screen")),
    );
  }
}

class PLMAdmissionTestScreen extends StatefulWidget {
  const PLMAdmissionTestScreen({super.key});
  @override
  _PLMAdmissionTestScreenState createState() => _PLMAdmissionTestScreenState();
}

class _PLMAdmissionTestScreenState extends State<PLMAdmissionTestScreen> {
  Map<String, bool> contentVisibility = {
    'whoMayApply': false,
    'applicationProcess': false,
    'tuitionFee': false,
  };

   Widget _buildText(String text) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      textAlign: TextAlign.justify,
    );
  }

 Widget _buildButton(String contentKey, String text, VoidCallback onPressed, {Color? backgroundColor, TextStyle? textStyle}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.yellow,
        //foregroundColor: const Color.fromRGBO(13, 71, 161, 1),
        textStyle: const TextStyle(fontSize: 16),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        minimumSize: const Size(300, 10), 
      ),
      onPressed: onPressed,
      child: Text(
      text,
      style: textStyle ?? const TextStyle(color: Color.fromRGBO(13, 71, 161, 1), fontWeight: FontWeight.bold),
    ),
    );
  }

  Widget _buildContactInfo() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 16, color: Colors.black),
        children: [
          TextSpan(text: 'For more info, you may contact the Admission Office \n \n Email address: '),
          TextSpan(
            text: 'admission_office@plm.edu.ph',
            style: TextStyle(color: Color.fromARGB(255, 13, 71, 161)),
          ),
        ],
      ),
    );
  }

  void _handleNavigation(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  void _toggleContentVisibility(String contentKey) {
    setState(() {
      contentVisibility[contentKey] = !contentVisibility[contentKey]!;
    });
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column( // <-- Use a Column to stack elements vertically
      children: [
        Stack(
          children: [
            ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: SizedBox(
              height: 300,
              child: Stack(
                children: [
                  AvifImage.asset(
                    'assets/images/plm_ad_bg.avif',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(255, 9, 134, 211),
                          Colors.transparent,
                        ], 
                        stops: [0.1, 5.0], 
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text( 
                      'PLM ADMISSION TEST',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, 
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          ],
        ),
        Expanded( // <-- Make the DraggableScrollableSheet take up the remaining space
          child: DraggableScrollableSheet(
            initialChildSize: 0.9, // Adjust to your desired initial height
            minChildSize: 0.9,     // Minimum size should be the same as initial
            maxChildSize: 1.0,     // Allow full expansion
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 0),
                      _buildText(
                        'The Pamantasan ng Lungsod ng Maynila (PLM) will start accepting online applications for freshmen students (undergraduate programs) for Academic Year (A.Y.) 2024-2025 starting December 1, 2023.',
                      ),
                      const SizedBox(height: 16),
                      _buildText(
                        'There will be an on-site PLM Admission Test (PLMAT) with minimum health protocols. The PLMAT is a 4-hour examination with sub-tests in English, Science, Mathematics, Filipino, and Abstract Reasoning. Passing the PLMAT is a requirement for admission to PLM.',
                      ),
                      const SizedBox(height: 20),
                      _buildButton('whoMayApply', 'Who may apply for PLMAT?', () => _toggleContentVisibility('whoMayApply')),
                      if (contentVisibility['whoMayApply']!)
                        _buildText('The student-applicant may apply provided that they comply with any of the following basic qualifications:\n\n1. Senior High School (SHS) student who is currently enrolled in Grade 12 Department of Education (DepEd) accredited senior high school with a grade 11 general weighted average (GWA) of 80 or above.\n\n2. Senior High School graduate from DepEd accredited senior high school with a grade 11 general weighted average (GWA) of 80 or above.\n\n3. The applicant completed Alternative Learning System (ALS) and passed the Accreditation &amp; Equivalency (A&amp;E) as recommended for tertiary education and has not taken any college or university units/programs during the application period.'),


                      _buildButton('applicationProcess', 'Application Process of PLMAT', () => _toggleContentVisibility('applicationProcess')),
                      if (contentVisibility['applicationProcess']!)
                        _buildText('1. Apply online through the PLM Admission Portal.\n\n2. Fill out the Application Form (online).\n\n3. Upload required application requirements (online).\n\na. PSA Birth Certificate\n  b. Certificate of Grade 11 GWA (SHS) / Certificate of Completion (ALS)\n\n4. Check email for the account credentials after submitting the application successfully. Log in to PLM admission account on a regular basis to check the status of the application.\n\n5. Upon evaluation of the information and requirements, print the Application Form.\n\n6. Upload scanned-signed Application Form with ID picture (2 x 2 colored with white background).\n\n7. Monitor the status of the Application Form at the PLM Admission Account.\n\n8. Check email for the PLMAT examination schedule after the Application Form has been successfully evaluated.\n\n9. Print two (2) copies of the exam permit.\n\n10. On the specified examination date, bring two (2) signed exam permits with an ID picture (2x2 colored with white background) and the signed Application Form with ID picture (2x2 colored with white background).'),

                      _buildButton('tuitionFee', 'How much is the tuition fee in PLM?', () => _toggleContentVisibility('tuitionFee')),
                      if (contentVisibility['tuitionFee']!)
                        _buildText('In PLM, the tuition fee is free. This means that students who pass the PLM Admission Test (PLMAT) and are admitted to the university do not have to pay tuition fees.\n\nStudents are, however, responsible for other fees such as miscellaneous and other related fees that can be found on the PLM website.'),
                     
                     const SizedBox(height: 20), 
                      Center(
                        child: Column(
                          children: [
                            _buildButton('plmatResults', 'PLMAT Results', () => _handleNavigation('/plmatResults'),
                                backgroundColor: const Color.fromARGB(255, 240, 232, 232),  textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 10),
                            _buildButton('applyForPlmat', 'Apply for PLMAT', () => _handleNavigation('/applyForPlmat'),  textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    
                      const SizedBox(height: 20),
                      const Text(
                        'Inquiries',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                     _buildContactInfo(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
}