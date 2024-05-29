import 'package:flutter/material.dart';

class AlumniRegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Alumni Registration Form',
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Color(0xff186fb7),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextWithAsterisk('First name:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Mary Ann',
              ),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('Middle name:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Velasco',
              ),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('Last name:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Geronimo',
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Name ext.(e.g. III, Jr., Sr.):',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Sr.',
              ),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('Date of Birth:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'yyyy-mm-dd',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Educational Background',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('Student Number:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: '202101234',
              ),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('College:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Name of College',
              ),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('Name of Course:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Name of Course',
              ),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('Year Graduated:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'yyyy',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Contact Information',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('Mobile Number:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: '09154286592',
              ),
            ),
            SizedBox(height: 10.0),
            _buildTextWithAsterisk('E-mail Address:'),
            SizedBox(height: 5.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'email@gmail.com',
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        // Handle submit button press
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        // Handle back button press
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffe8e8e8)),
                      ),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextWithAsterisk(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
        Text(
          '*',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}