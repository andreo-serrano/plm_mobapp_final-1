import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../mcat/mcat_screen.dart';
import '../../widgets/button.dart';
import '../../widgets/appbar.dart';

class EnrollmentInstructionsScreen extends StatelessWidget {
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
                SizedBox(height: 30),
                Text(
                  'Who May Apply?',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color.fromARGB(255, 0, 102, 153),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 10),
                Text(
                  'Anyone who meets the following qualifications and possesses the desire to serve may apply:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 30),
                Text(
                  'Qualifications',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color.fromARGB(255, 0, 102, 153),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 10),
                BulletList(
                  items: [
                    'A natural-born Filipino citizen',
                    'Complied with all academic preparations',
                    'With NMAT score of 45 or higher taken within 2 years prior to application deadline',
                    'No record of dropping from any medical school',
                    'No record of denied admission in PLM College of Medicine',
                    'No record of conviction of crime involving moral turpitude; and',
                    'Must have no failing grade in any subject',
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Lateral entrees from other medical schools will not be entertained.\n\nSuccessful applicants are expected to perform excellently and hurdle the rigors in their studies at PLM.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 30),
                ButtonFill(
                  buttonText: 'MCAT Results',
                  color: const Color.fromARGB(255, 0, 0, 0),
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

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: TextStyle(fontSize: 20)),
                Expanded(child: Text(item, style: Theme.of(context).textTheme.bodyMedium)),
              ],
            ),
          )
          .toList(),
    );
  }
}

class MCATResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('MCAT Results', style: TextStyle(fontSize: 21.0)),
              centerTitle: true,
              background: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/med.jpg', // Ensure this path is correct
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Your MCAT results will be displayed here.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                // Add more widgets here to display the results as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
