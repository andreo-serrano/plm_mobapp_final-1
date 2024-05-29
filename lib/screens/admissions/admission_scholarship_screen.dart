import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/bulletList.dart';
import '../../widgets/button.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage({super.key});

  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholarships'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Scholarships and Financial Aid',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color.fromARGB(255, 163, 25, 32),
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                'PLM partners with foundations and generous individuals to provide poor but deserving students the fighting chance that they deserve. Depending on the partners, scholars receive monthly stipends, book allowances, and even a year-end bonus.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              Text(
                'AY 2022-2023 Scholarship Partners',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              const Text(
                'For the Academic Year 2022-2023, 24 scholarship partners provide PLM students with not only financial assistance but also training and opportunities for exposure. Out of the 24, 21 are group sponsors and three are individual providers',
              ),
              const SizedBox(height: 30),
              Text('The following are the group scholarship providers:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 20),
              const BulletList([
                'AMY Foundation',
                'Alfonso Yuchengco Foundation',
                'Buddhist Tzu Chi Foundation',
                'Cebuana Lhuillier Foundation',
                'Charity First Foundation',
                'Chinese Filipino Business Club',
                'DBP Foundation',
                'Evangeline Barrios Fletcher-Shepherd Scholarship Grant',
                'Fil-Am Society of Masters and Past Masters in California Masonry',
                'Gokongwei Brothers Foundation, Inc.',
                'International Container Terminal Services, Inc.',
                'Landbank North NCRBG',
                'Lingap Adhikain Foundation',
                'Luis Co Chi Kiat Foundation',
                'Manila Mt. Lebanon',
                'Master Rui Miao Foundation',
                'MegaWide Foundation',
                'Megaworld Foundation',
                'Miami Foundation (Fain Foundation)',
                'PLM-Scholarship Foundation, Inc.',
                'Security Bank Foundation',
                'Simplicio Gamboa, Sr. Foundation',
                'SM Foundation'
              ]),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text:
                          'The following are the ',
                    ),
                    TextSpan(
                      text: 'three (3) individual providers/sponsors',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          ' who are mostly PLM officials, alumni, philanthropists, and friends of PLM:',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const BulletList([
                'Ambassador and former Regent Ramon Bagatsing, Jr.',
                'Mr. Marc Gorospe',
                'Mr. Russel Tena',
              ]),
              const SizedBox(height: 20),
              Text(
                'Frequently Asked Questions (FAQs)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'How are scholars selected?',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              const BulletList([
                'Family annual income of Php 300,000.00 or less',
                'General Weighted Average (GWA) of not less than 2.25',
                'With no previous scholarship application nor a recipient of any scholarship grant',
                'Full-time student (from all levels) with regular load',
                'With good moral character',
              ]),
              const SizedBox(height: 20),
              Text(
                'Who can become scholarship providers?',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Organizations or individuals interested to provide scholarships to PLM students may contact the Office of Public Affairs (OPA) and enter into a Memorandum of Agreement subject to the Board of Regent\'s approval.\n\n'
                'Inquiries and letters of intent may be addressed to:\n\n',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Dina C. Mendez',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 0),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    const TextSpan(
                      text: 'OIC, Public Affairs\nEmail: ',
                    ),
                    TextSpan(
                      text: 'vppa@plm.edu.ph',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('mailto:vppa@plm.edu.ph');
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Once the partnership is approved, the OPA contacts the University Committee on Scholarship and Office of Student Development and Services (OSDS) as Committee Secretariat about the scholarship requirements and slots for dissemination to the colleges and Information and Communications Technology (ICTO) so that students who need the financial aid could apply.\n\n'
                'The colleges receive applications from interested students. Then it submits the applications to the OSDS, which creates a shortlist using the scholarship providers\' criteria. This list is submitted to the Committee on Scholarship, which makes the final recommendation and submits it to the OPA. The OPA then coordinates the recommended scholars to the scholarship providers for their concurrence.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              ButtonFill(buttonText: 'Apply', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
