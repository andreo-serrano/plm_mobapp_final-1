// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:plmmobileapp_v2/screens/sfe/student_faculty_evalutation.dart';
import 'package:plmmobileapp_v2/screens/sfe/student_summary_answer_screen.dart';
import 'package:plmmobileapp_v2/utils/sfe/sfefacultydata.dart';



class SFEHomePage extends StatefulWidget {
  final userId;

  const SFEHomePage({super.key, this.userId});

  @override
  State<SFEHomePage> createState() => _SFEHomePageState();
}
class _SFEHomePageState extends State<SFEHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffab0000),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Student Faculty Evaluation'),
        actions: const [],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(color:  Color(0xFFDAA300), size: 26),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedItemColor:  const Color(0xFFDAA300),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        currentIndex: currentPageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.summarize_outlined),
            activeIcon: Icon(Icons.summarize_rounded),
            label: 'Summary of Answers',
          ),
        ],
      ),
      body: <Widget>[

        const SFEContent(),
        const SFESummaryPage(),
      ][currentPageIndex],
    );
  }
}



class SFEContent extends StatefulWidget {
  const SFEContent({super.key});

  @override
  State<SFEContent> createState() => _SFEContentState();
}

class _SFEContentState extends State<SFEContent> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(1.5),
            1: FlexColumnWidth(1.5),
            2: FlexColumnWidth(1.2),
            3: FlexColumnWidth(1.5),
          },
          children: [
            const TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Center(
                      child: Text(
                        'FACULTY NAME',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Center(
                      child: Text(
                        'SUBJECT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Center(
                      child: Text(
                        'STATUS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            for (var faculty in facultyData)
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey[100]!,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey[100]!,
                      width: 1.0,
                    ),
                  ),
                ),
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 12),
                      child: Center(
                        child: Text(faculty.facultyName ?? ''),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 12),
                      child: Center(
                        child: Text(faculty.subject ?? ''),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 12),
                      child: Center(
                        child: Text(faculty.status ?? ''),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SFEEvaluationPage(facultyName: faculty.facultyName, facultySubject: faculty.subject)));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFDAA300)),
                            minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          child: const Text(
                            'Evaluate',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}






