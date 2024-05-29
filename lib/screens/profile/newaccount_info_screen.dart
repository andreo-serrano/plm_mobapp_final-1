
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'edit_contactdetails_screen.dart';

class AccountInformation2 extends StatefulWidget {
  const AccountInformation2({super.key});

  @override
  State<AccountInformation2> createState() => _AccountInformationState2();
}

class _AccountInformationState2 extends State<AccountInformation2>{
  bool _showPersonalInfo = true;

  void _toggleWidgets() {
    setState(() {
      _showPersonalInfo = !_showPersonalInfo;
    });
  }

  void personalbuttonpressed(){
    if (_showPersonalInfo == false){
      _toggleWidgets();
    }
  }

  void schoolbuttonpressed() {
    if (_showPersonalInfo == true){
      _toggleWidgets();
    }
  }

  Widget personalInfoWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: personalbuttonpressed,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black, 
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(180, 75),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                shadowColor: Colors.black,
                elevation: 4
              ),
              child: const Text(
                "Personal", 
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
              ),
            ),
            TextButton(
              onPressed: schoolbuttonpressed,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey, 
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(180, 75),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                shadowColor: Colors.black,
                elevation: 4
              ),
              child: const Text(
                "School", 
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
              ),
            ),
          ]
        ),
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0,30,0,0),
              child: Text(
                "Juan Dela Cruz",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0,10,0,0),
              child: Text(
                "BS Computer Science",
                style: TextStyle(fontSize: 16, color: Colors.black)
              ),
            ),
          ],
        ),
        const Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,30,15,0),
                child: Text("Primary Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff006699)),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,20,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("First Name",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("JUAN", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Last Name",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("DELA CRUZ", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Middle Name",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("MARTINEZ", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Pedigree",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("None", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Gender",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("Male", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Civil Status",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("Single", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Country of Citizenship",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("Philippines", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15,30,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Contact Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff006699)),
                    ),
                    RichText(
                      text: TextSpan(text: "Edit", 
                      style: const TextStyle(fontSize: 14, color: Color(0xff006699)),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditDetailsPage()))
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,20,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Personal Email",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("jdelacruz2021@gmail.com", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,20,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Contact Number",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("09657528643", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ],
    );
  }

  Widget schoolInfoWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: personalbuttonpressed,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey, 
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(180, 75),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                shadowColor: Colors.black,
                elevation: 4
              ),
              child: const Text(
                "Personal", 
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
              ),
            ),
            TextButton(
              onPressed: schoolbuttonpressed,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black, 
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(180, 75),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                shadowColor: Colors.black,
                elevation: 4
              ),
              child: const Text(
                "School", 
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
              ),
            ),
          ]
        ),
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0,30,0,0),
              child: Text(
                "Juan Dela Cruz",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0,10,0,0),
              child: Text(
                "BS Computer Science",
                style: TextStyle(fontSize: 16, color: Colors.black)
              ),
            ),
          ],
        ),
        const Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,30,15,0),
                child: Text("Primary Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff006699)),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,20,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Student Number",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("2021-12345", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Student Type",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("Old", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Registration Status",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("Regular", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Degree Program",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("Bachelor of Science in Computer Science", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,13,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Year Level",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("2", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,30,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Contact Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff006699)),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,20,15,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text("Official PLM Email",
                      style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: Colors.black),
                      ), 
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("jdelacruz2021@plm.edu.ph", 
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black,
                        ),
                      textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: const AssetImage("assets/images/profscreenplmbg1.jpg"
                  )
                )
              )
            ),
             Container(
              padding: const EdgeInsets.fromLTRB(5, 40, 20, 20),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
                highlightColor: const Color.fromARGB(0, 0, 0, 255),
                onPressed: (){
                  Navigator.pop(context);
                }
              ),
            ),
             Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Container(
                    alignment: Alignment.topCenter,
                    constraints: const BoxConstraints(
                      minWidth: 300,
                      maxWidth: 500,
                      minHeight: 200,
                      maxHeight: 680,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: 
                    _showPersonalInfo ? personalInfoWidget() : schoolInfoWidget() 
                  )
                )
              ), 
          const Positioned(
            bottom:25,
            left: 45,
            right: 45,
                child: Text("Your college shall be determined from the degree program indicated here. If the degree program is erroneous, please contact your respective college's OCS. If all details shown here are correct, you may proceed to the Pre-enlistment Page by clicking the link on the menu bar.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Color(0xFF71717A))
                ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,30,0,0),
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                        image: AssetImage('assets/images/profile-default.jpg')),
                  ),
                ),
              ),
            ),
          ]
        )
    );
  }  
}
