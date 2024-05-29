import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';

class ClatScreen extends StatelessWidget {
  const ClatScreen({super.key});

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
    'searchApplicant': false, // Initialize to false
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
                  Image.asset(
                    'assets/images/plm_clat_bg.jpg', 
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
                      'COLLEGE OF LAW\nRESULTS',
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
                      const Text("Find your name:",  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
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
                                  'We are delighted to inform you that you have been accepted into College of Law at PLM! This is a testament to your talent and potential. We believe that you have a bright future ahead, and we cannot wait to see what you will accomplish as a PLM student. Welcome to the PLM family!'
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
          TextSpan(text: 'For more info, you may contact the College of Law \n\n Email address: '),
          TextSpan(
            text: 'clgroup@plm.edu.ph',
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
                  Image.asset(
                    'assets/images/plm_clat_bg.jpg',
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
                      'COLLEGE OF LAW \nADMISSION TEST',
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
                        'The College of Law is among the the top 10 law schools based on the 2018 bar examination. It received a 51.61% passing rate in 2018 bar exams, which is higher than the 22.07% national passing rate. ',
                      ),
                      const SizedBox(height: 16),
                      _buildText(
                        'It is headed by Atty. Magelio S. Arboladura.',
                      ),
                      const SizedBox(height: 16),
                      _buildText(
                        'Program offered\n1. Juris Doctor',
                      ),
                      const SizedBox(height: 20),
                      _buildButton('whoMayApply', 'Admission Requirements ', () => _toggleContentVisibility('whoMayApply')),
                      if (contentVisibility['whoMayApply']!)
                        _buildText('1. A general Weighted Average (GWA) of at least 2.00 or (84%) in the bachelor’s degree. \n\n2. Applicants must have earned 18 units of English, 6 units of Mathematics, 18 units of Social Science subjects. Applicants lacking units must satisfy these requirements during summer before they are allowed admission. \n\n3. Manila residency 43 evidenced by the applicant’s voter’s ID/certification, and a Barangay certification (for Manila’s partial scholars only). Non-residents of Manila may apply as regular full-paying students. \n\n4. Official Transcript of Records (TOR) from a recognized university or college. \n\n5. Any government-issued ID (competent evidence of identification) and/or CTC. \n\n6.Income tax return of applicant or the applicant’s parent from the year prior to the date of application. \n\n7. Two (2) recent passport size, identical colored photos. \n\n8. A letter of recommendation from the Dean or Head of former school.'),

                      _buildButton('applicationProcess', 'Application Process of CLAT', () => _toggleContentVisibility('applicationProcess')),
                      if (contentVisibility['applicationProcess']!)
                        _buildText('1. Submit requirements to the College for Committee on Admission and for interview to make initial screening according to the criteria on admission. \n\n2. Application form is issued to applicants who meet the criteria for admission and completed documents are returned. \n\n3. Pay the non-refundable CLAT fee via the following: \na.  Land Bank of the PhilippinesLinkBiz Portal \nb.  Bank deposit: \n\nAccount name: Pamantasan ng Lungsod ng Maynila\n Account number: LBP–2472 1006 56 \n\n4. Submit the filled-out application form together with requirements. \n\n5. Applicant who passes the CLAT will be informed of the date of interview. Non-response within five (5) days and/or his/her non-appearance will cause forfeiture of slot in the College. \n\n6. Qualified applicants will be informed of enrollment schedule. The list of successful freshmen will be posted in the College of Law. \n\n\nAcceptance to the college will be based on the satisfaction of the following: \n1. Compliance with admission requirements. \n2. Submission of required documents. \n3. Passing of the College of Law Admission Test (CLAT). \n4. Personal interview and evaluation by the Committee on Admissions. \n\n\nThe Committee on Admission reserves the right to deny the admission of an applicant if the requirements and all other admission criteria are not satisfactorily complied with.  Admission decision will be based on the result of the evaluation of all the required documents, as well as the entrance examination and the interview. The Committee on Admission shall submit to the Dean of the College its recommendation for his review and final recommendation to the President of the University. \n\n Any evidence of fraud, misrepresentation, or non-disclosure by the applicant of any information relative to the requirements shall be ground for the cancellation of his admission or enrollment.'),
                      _buildButton('tuitionFee', 'How much is the tuition fee in PLM?', () => _toggleContentVisibility('tuitionFee')),
                      if (contentVisibility['tuitionFee']!)
                        _buildText('In PLM, the tuition fee is free. This means that students who pass the PLM Admission Test (PLMAT) and are admitted to the university do not have to pay tuition fees.\n\nStudents are, however, responsible for other fees such as miscellaneous and other related fees that can be found on the PLM website.'),
                     
                     const SizedBox(height: 20), 
                      Center(
                        child: Column(
                          children: [
                            _buildButton(
                              'plmatResults',
                              'CLAT Results',
                              () => _handleNavigation('/plmatResults'),
                              backgroundColor: const Color.fromARGB(255, 240, 232, 232),
                              textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Set text color to black
                            ),
                            const SizedBox(height: 10),
                            _buildButton(
                              'applyForPlmat',
                              'Apply for CLAT',
                              () => _handleNavigation('/applyForPlmat'),
                              textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Set text color to black
                            ),
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