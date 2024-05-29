// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:plmmobileapp_v2/screens/alumni/Alumni_Registration_Form.dart';
import 'package:plmmobileapp_v2/screens/alumni/drs_form.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

class AlumniScreen extends StatefulWidget {
  const AlumniScreen({super.key});

  @override
  State<AlumniScreen> createState() => _AlumniScreenState();
}

class _AlumniScreenState extends State<AlumniScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 320;
    double screenHeight = MediaQuery.of(context).size.height / 668;
    return Scaffold(
      body: CustomSliverAppBar(
          text: 'Alumni',
          image: 'assets/images/alum.jpg',
          isCenter: false,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15 * screenHeight),
                Text(
                  'PLM produces a diverse corps of professionals who contribute to the economic efforts of the city -- all the way to the international fronts.'
                      '\n\nIn the school community, the alumni are a major stakeholder -- highlighted by their sense of gratitude to return the favor of transformative education.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 63 * screenHeight),
                Text(
                  'Alumni Registration System (ARS)',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'PLM produces a diverse corps of professionals who contribute to the economic efforts of the city -- all the way to the international fronts.'
                      '\n\nIn the school community, the alumni are a major stakeholder -- highlighted by their sense of gratitude to return the favor of transformative education.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10 * screenHeight),
                SizedBox(
                  width: 141 * screenWidth,
                  child: ButtonFill(
                    buttonText: "Fill out online ARS",
                    bgColor: Colors.amber,
                    onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AlumniRegistrationForm()))
                            },
                  ),
                ),
                SizedBox(height: 20 * screenHeight),
                Text(
                  'Document Request System',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'PLM Alumni can now conveniently request official documents through this online request system! Your academic records and verifications are now just a few clicks away.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10 * screenHeight),
                SizedBox(
                  width: 141 * screenWidth,
                  child: ButtonFill(
                    buttonText: "Request Documents",
                    bgColor: Colors.amber,
                    onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DRSPage()));
                    },
                  ),
                ),
                SizedBox(height: 20 * screenHeight),
                Text(
                  'Career Placement for Alumni',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'Looking for the right place in the industry? Check out the job calls from our industry partners:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10 * screenHeight),
                SizedBox(
                  width: 141 * screenWidth,
                  child: ButtonFill(
                    buttonText: "Job Posts",
                    bgColor: Colors.amber,
                    onPressed: () {
                      const url = 'https://plm.edu.ph/careers-alumni';
                      launch(url.toString());
                    },
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}