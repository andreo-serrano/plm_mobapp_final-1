// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import '../../utils/contactdata.dart';

class ContactInformation extends StatefulWidget {
  const ContactInformation({super.key});

  @override
  _ContactInformationState createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  late List<Data> adminContacts, collegesContacts;
  final columns = ['Office', 'Phone', 'Email'];

  List<DataColumn> getColumns(List<String> column) => column
      .map((String column) => DataColumn(
    label: Text(column),
  ))
      .toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((data) => DataCell(SizedBox(
    width: MediaQuery.of(context).size.width / 3 - 20.0,
    child: Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Text(
        '$data',
        style: const TextStyle(fontSize: 12.0),
      ),
    ),
  )))
      .toList();

  List<DataRow> getRows(List<Data> contacts) => contacts.map((Data contact) {
    final cells = [contact.office, contact.phone, contact.email];
    return DataRow(cells: getCells(cells));
  }).toList();

  @override
  void initState() {
    super.initState();
    adminContacts = List.of(allAdminContacts);
    collegesContacts =List.of(allCollegeContacts);
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200.0,
          centerTitle: true,
          title: const SizedBox(
            height: 150,
            child: Text('Contact Information',
                style: TextStyle(fontSize: 21)),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              height: 158,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/plmimage.png"))),
            ),
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BackButton(
                  color: Colors.white,
                  onPressed: () {Navigator.pop(context);}),
            ],
          ),
          backgroundColor: const Color(0xFF006699),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Administratives',),
              Tab(text: 'Colleges'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  DataTable(
                    headingRowHeight: 40.0,
                    headingRowColor: MaterialStateProperty.all<Color>(const Color(0xFFE9E9E9)),
                    dataRowHeight: 60.0,
                    columnSpacing: 10.0,
                    columns: getColumns(columns),
                    rows: getRows(adminContacts),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  DataTable(
                    headingRowHeight: 40.0,
                    headingRowColor: MaterialStateProperty.all<Color>(const Color(0xFFE9E9E9)),
                    dataRowHeight: 60.0,
                    columnSpacing: 10.0,
                    columns: getColumns(columns),
                    rows: getRows(collegesContacts),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


