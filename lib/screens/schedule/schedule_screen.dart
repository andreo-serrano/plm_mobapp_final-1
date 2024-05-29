// ignore_for_file: deprecated_member_use, implementation_imports, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:pdf/src/pdf/color.dart';
import 'package:path_provider/path_provider.dart';
import '../../model/progressHUD.dart';
import '../../model/request.dart';
import '../../model/student_model.dart';
import '../../services/api_service.dart';
import 'dart:io';
import '../../widgets/button.dart';


class Schedule extends StatefulWidget {
  const Schedule({super.key});
  // final List<ScheduleResponseModel> classes;

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List<ScheduleResponseModel> classes = [];
  List<ScheduleResponseModel> todayClasses = [];
  List<String> todayClassTime = [];
  final _now = DateTime.now().add(const Duration(hours: 8));
  bool isApiCallProcess = false;
  bool isTodayClasses = false;
  String firstName = '';
  //
  // DateTime get _now => DateTime.now();

  @override
  void initState()  {
    super.initState();
    fetchSchedule();
  }

  void fetchSchedule() async {
    classes = await APIService().fetchClasses();
    firstName = await UserSecureStorage.getFirstName() ?? '';
    setState(() {
      getTodayClasses();
    });
  }

  getTodayClasses() {
    final weekday = DateFormat('E').format(_now);
    for (var element in classes) {
      List<String> str = element.schedule.split(',');
      // str.forEach((day) {
      //   day[0].toString() == 'F' ? {
      //     todayClasses.add(element),
      //     todayClassTime.add(day.split(' ')[1]),
      //   } : null;
      // });

      for (var day in str) {day[0].toString() == weekday[0] ? {
          todayClasses.add(element),
          todayClassTime.add(day.split(' ')[1]),
        } : null;
      }
    }
    setState(() {
      isTodayClasses = todayClasses.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      child: _uiSetUp(context),
    );
  }

  Widget _uiSetUp(BuildContext context) {
    final weekday = DateFormat('E').format(_now);
    final date =  DateFormat('yMMMMEEEEd').format(_now);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Schedule'),
          centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30.0),
              Text('Today is $date'),
              const SizedBox(height: 5),
              Text('Hi $firstName!', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20.0),
              Text('Your Classes', style: Theme.of(context).textTheme.titleMedium),
              Expanded(
                child: isTodayClasses == true ? ListView.builder(
                    itemCount: todayClasses.length,
                    itemBuilder: (context, int index)  {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200,
                          ),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(todayClassTime[index], style: Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 10.0),
                              Text(todayClasses[index].subject, style: Theme.of(context).textTheme.titleMedium,),
                              Text(todayClasses[index].classCode),
                              Text('Section: ${todayClasses[index].section}'),
                              Text(todayClasses[index].schedule),
                            ],
                          ),
                        ),
                      );
                    }
                ) : const Text('No classes today'),
              ) ,
              const SizedBox()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 70,
          child: ButtonFill(
              buttonText: 'View Full Schedule',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => FullSchedule(classes: classes)));
              },
          ),
        ),
      ),
    );
  }
}

class FullSchedule extends StatelessWidget {
  const FullSchedule({
    super.key,
    required this.classes,
  });

  final List<ScheduleResponseModel> classes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Schedule'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: ScheduleTable(classes: classes),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 70,
          child: ButtonFill(
            buttonText: "Download",
            bgColor: Colors.amber,
            onPressed: () {download();},
          ),
        ),
      ),
    );
  }

  Future<void> download() async {
    final pdf = pw.Document();
    final fontBold = await rootBundle.load("assets/fonts/Lato-Bold.ttf");
    final ttfBold = pw.Font.ttf(fontBold);

    final yellow = PdfColor.fromHex('EAB700');
    final red = PdfColor.fromHex('A31920');

    final image = pw.MemoryImage(
        (await rootBundle.load('assets/images/plmseal.png'))
            .buffer
            .asUint8List());

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
            child: pw.Column(
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                        width: 50,
                        height: 50,
                        child: pw.Image(image),
                      ),
                      pw.SizedBox(width: 20.0),
                      pw.Column(
                          children: [
                            pw.Text('PAMANTASAN NG LUNGSOD NG MAYNILA',
                                style: pw.TextStyle(fontSize: 16,
                                    font: ttfBold,
                                    color: yellow)),
                            pw.Text('UNIVERSITY OF THE CITY OF MANILA',
                                style: pw.TextStyle(fontSize: 16,
                                  font: ttfBold)),
                          ]
                      )
                    ]
                ),
                pw.SizedBox(height: 20.0),
                pw.Text(
                    'CLASS SCHEDULE', style: pw.TextStyle(
                    fontSize: 24,font: ttfBold, color: red)),
                pw.SizedBox(height: 20.0),
                pw.Table.fromTextArray(
                    headerStyle: pw.TextStyle(
                        fontSize: 12, font: ttfBold, color: red),
                    cellStyle: const pw.TextStyle(fontSize: 12),
                    data: <List<dynamic>>[
                      <String>['Class', 'Section', 'Schedule', 'Units'],
                      ...classes.map((student) =>
                      [
                        student.subject,
                        student.section,
                        student.schedule,
                        student.units
                      ])
                    ])
              ],
            )
        ),
      ),
    );

    final output = (await getExternalStorageDirectory())!.path;
    final file = File("$output/schedule.pdf");
    await file.writeAsBytes(await pdf.save());
    OpenFile.open(file.path);
  }
}

class ScheduleTable extends StatelessWidget {
  const ScheduleTable({
    super.key,
    required this.classes,
  });

  final List<ScheduleResponseModel> classes;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 10.0, // Increase or decrease the horizontal margin
      dataRowMaxHeight: 70.0, // Increase or decrease the maximum row height
      columnSpacing: 12.0, // Increase or decrease the column spacing
      columns: const <DataColumn>[
        DataColumn(label: Text('Code')),
        // DataColumn(label: Text('Subject')),
        DataColumn(label: Text('Units')),
        // DataColumn(label: Text('Section')),
        DataColumn(label: Text('Schedule')),

      ],
      rows: classes.map((e) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(
              e.classCode,
              style: TextStyle(fontSize: 16), // these texts are now adjustable
            )),
            DataCell(Text(
              e.units,
              style: TextStyle(fontSize: 16), // these texts are now adjustable
            )),
            DataCell(Text(
              e.schedule,
              style: TextStyle(fontSize: 16), // these texts are now adjustable
            )),

          ],
        );
      }).toList(),
    );
  }
}
