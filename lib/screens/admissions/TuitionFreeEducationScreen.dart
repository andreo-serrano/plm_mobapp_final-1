// enrollment_instructions_screen.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:plmmobileapp_v2/screens/admissions/EnrollmentInstructionsScreen.dart';
import '../mcat/mcat_screen.dart';
import '../../widgets/button.dart';
import '../../widgets/appbar.dart';

class TuitionFreeEducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSliverAppBar(
        text: 'College of Medicine Admission Test',
        image: 'assets/images/med.jpg',
        isCenter: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0),
                Text(
                  'Application Process',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color.fromARGB(255, 0, 102, 153),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 10),
                Text(
                  'Applicants must complete the following steps to be eligible for ranking. To apply, interested parties are to proceed to the PLM College of Medicine office. Online applications are no longer entertained to provide immediate feedback on the status of the requirements submitted.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10),
                NumberedList(
                  items: [
                    'Completely accomplish the application form that includes applicant’s complete name (as shown in birth certificate and school records), present address, mobile number, email address and other details pertinent about the applicant’s background.\n',
                    'Submit the following documents:\n\n  a. Birth Certificate\n  b. Official National Medical Aptitude Test (NMAT) result\n  c. Official Transcript of Records (for undergraduates: Certification of Grades reflecting all grades up to the 1st semester of the current school year).\n  d. Certificate of General Weighted Average from the Registrar/College (for undergraduates: GWA of subjects taken up to the 1st semester of the current school year).\n  e. Voter\'s Certification of Registration with voting history (FOR MANILANS ONLY)\n  f. Both parents\' latest ITR/Certification of Employment/Copy of Contract \n',
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'After being assessed as qualified applicants, the applicants are to pay the application fee of ',
                          ),
                          TextSpan(
                            text: 'P3,500.00',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' as either over-the-counter deposit to the LANDBANK or through online money transfer at the ',
                          ),
                          TextSpan(
                            text: 'LBP LinkBiz Portal',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launch('https://www.lbp-eservices.com/egps/portal/Merchants.jsp');
                              },
                          ),
                          TextSpan(
                            text: ' under the following account details:\n\nAccount name: Pamantasan ng Lungsod ng Maynila\nAccount number: LBP–2472 1006 56\nThe proof of deposit (original and photocopy) is to be submitted to the PLM College of Medicine.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Image.asset('assets/images/landbank.jpg', fit: BoxFit.cover),
                SizedBox(height: 30),
                ButtonFill(
                  buttonText: 'MCAT Results',
                  color: Color.fromARGB(255, 0, 0, 0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MCATResultsScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                ButtonFill(
                  buttonText: 'Apply',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MCATScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'Inquiries',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color.fromARGB(255, 0, 102, 153),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'For more info, you may contact the College of Medicine:\nEmail address: ',
                      ),
                      TextSpan(
                        text: 'plmcmadmissions@plm.edu.ph',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch('mailto:plmcmadmissions@plm.edu.ph');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NumberedList extends StatelessWidget {
  final List<dynamic> items;

  const NumberedList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${index + 1}. ', style: TextStyle(fontSize: 20)),
            Expanded(
              child: items[index] is String
                  ? Text(
                      items[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  : items[index],
            ),
          ],
        );
      }),
    );
  }
}