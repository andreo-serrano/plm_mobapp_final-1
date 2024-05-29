import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class MCATScreen extends StatefulWidget {
  const MCATScreen({super.key});

  @override
  State<MCATScreen> createState() => _MCATScreenState();
}

class _MCATScreenState extends State<MCATScreen> {
  int activeStep = 3;
  String? selectedNameExt,
      selectedSex,
      selectedCivilStatus,
      selectedRegion,
      selectedCity,
      selectedProvince;

  DateTime? selectedBirthDate, selectedNmatDate;

  bool isSubmitting = false;
  bool showErrors = false;

  final List<String> title = [
        'Personal Information',
        'Mailing Address',
        'Educational Information',
        'Requirements',
        'Certification',
        'Confirmation'
      ],
      nameExtList = [
        'Select Name Extension',
        'Jr.',
        'Sr.',
        'I',
        'II',
        'III',
      ],
      civilStatusOptions = [
        'Select Civil Status',
        'Single',
        'Married',
        'Divorced',
        'Widowed',
      ],
      regionList = [
        'Select Region',
        'Bangsamoro Autonomous Region in Muslim Mindanao',
        'Bicol Region',
        'CALABARZON',
        'Cagayan Valley',
        'Caraga',
        'Central Luzon',
        'Central Visayas',
        'Cordillera Administrative Region',
        'Davao Region',
        'Eastern Visayas',
        'Ilocos Region',
        'MIMAROPA Region',
        'National Capital Region',
        'Northern Mindanao',
        'SOCCSKSARGEN',
        'Western Visayas',
        'Zamboanga Peninsula',
      ],
      cityMunicipality = [
        'Select City/Municipality',
        'Alaminos',
        'Angeles City',
        'Bacolod',
        'Bacoor',
        'Baguio',
        'Bago',
        'Baguio',
        'Bais',
        'Bayawan',
        'Baybay',
        'Biñan',
        'Bislig',
        'Butuan',
        'Cabadbaran',
        'Cabuyao',
        'Cadiz',
        'Cagayan de Oro',
        'Calamba',
        'Calapan',
        'Calbayog',
        'Caloocan',
        'Candon',
        'Canlaon',
        'Cavite City',
        'Cebu City',
        'Cotabato City',
        'Dagupan',
        'Danao',
        'Dapitan',
        'Dasmariñas',
        'Davao City',
        'Digos',
        'Dipolog',
        'Dumaguete',
        'El Salvador',
        'Escalante',
        'Gapan',
        'General Santos',
        'Gingoog',
        'Himamaylan',
        'Iligan',
        'Iloilo City',
        'Imus',
        'Iriga',
        'Island Garden City of Samal',
        'Kabankalan',
        'Kidapawan',
        'Koronadal',
        'La Carlota',
        'Lamitan',
        'Laoag',
        'Lapu-Lapu City',
        'Las Piñas',
        'Legazpi',
        'Ligao',
        'Lipa',
        'Lapu-Lapu City',
        'Makati',
        'Malabon',
        'Malaybalay',
        'Malolos',
        'Mandaluyong',
        'Mandaue',
        'Manila',
        'Marawi',
        'Marikina',
        'Masinloc',
        'Mati',
        'Meycauayan',
        'Muntinlupa',
        'Naga',
        'Navotas',
        'Naga',
        'Olongapo',
        'Ormoc',
        'Oroquieta',
        'Ozamiz',
        'Pagadian',
        'Palayan',
        'Panabo',
        'Parañaque',
        'Pasay',
        'Pasig',
        'Passi',
        'Puerto Princesa',
        'Quezon City',
        'Rosales',
        'Roxas',
        'San Carlos',
        'San Carlos',
        'San Fernando',
        'San Fernando',
        'San Francisco',
        'San Jose',
        'San Jose del Monte',
        'San Juan',
        'San Juan',
        'San Pablo',
        'San Pedro',
        'San Jose del Monte',
        'Santiago',
        'Santiago',
        'Santo Tomas',
        'Silay',
        'Sipalay',
        'Sorsogon City',
        'Surigao City',
        'Surigao City',
        'Tabaco',
        'Tabuk',
        'Tacloban',
        'Tacurong',
        'Tagaytay',
        'Tagbilaran',
        'Tagum',
        'Talisay',
        'Talisay',
        'Tanauan',
        'Tangub',
        'Tanjay',
        'Tarlac City',
        'Tayabas',
        'Trece Martires',
        'Tuguegarao',
        'Tugdan (Boracay)',
        'Urdaneta',
        'Valencia',
        'Valenzuela',
        'Victorias',
        'Vigan',
        'Zamboanga City'
      ],
      provinceList = [
        'Select Province',
        'Abra',
        'Agusan del Norte',
        'Agusan del Sur',
        'Aklan',
        'Albay',
        'Antique',
        'Apayao',
        'Aurora',
        'Basilan',
        'Bataan',
        'Batanes',
        'Batangas',
        'Benguet',
        'Biliran',
        'Bohol',
        'Bukidnon',
        'Bulacan',
        'Cagayan',
        'Camarines Norte',
        'Camarines Sur',
        'Camiguin',
        'Capiz',
        'Catanduanes',
        'Cavite',
        'Cebu',
        'Compostela Valley',
        'Cotabato',
        'Davao del Norte',
        'Davao del Sur',
        'Davao Occidental',
        'Davao Oriental',
        'Dinagat Islands',
        'Eastern Samar',
        'Guimaras',
        'Ifugao',
        'Ilocos Norte',
        'Ilocos Sur',
        'Iloilo',
        'Isabela',
        'Kalinga',
        'La Union',
        'Laguna',
        'Lanao del Norte',
        'Lanao del Sur',
        'Leyte',
        'Maguindanao',
        'Marinduque',
        'Masbate',
        'Metro Manila',
        'Misamis Occidental',
        'Misamis Oriental',
        'Mountain Province',
        'Negros Occidental',
        'Negros Oriental',
        'Northern Samar',
        'Nueva Ecija',
        'Nueva Vizcaya',
        'Occidental Mindoro',
        'Oriental Mindoro',
        'Palawan',
        'Pampanga',
        'Pangasinan',
        'Quezon',
        'Quirino',
        'Rizal',
        'Romblon',
        'Samar',
        'Sarangani',
        'Siquijor',
        'Sorsogon',
        'South Cotabato',
        'Southern Leyte',
        'Sultan Kudarat',
        'Sulu',
        'Surigao del Norte',
        'Surigao del Sur',
        'Tarlac',
        'Tawi-Tawi',
        'Zambales',
        'Zamboanga del Norte',
        'Zamboanga del Sur',
        'Zamboanga Sibugay'
      ];

  final List<String> texts = List.generate(22, (_) => '');
  final List<TextEditingController> controllers =
      List.generate(30, (_) => TextEditingController());

  final List<String?> _fileNameList = List.filled(6, null);

  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhoneNumber(String? phoneNumber) {
    RegExp phoneRegex = RegExp(r'^(09|\+639)\d{9}$');
    final isPhoneNumberValid = phoneRegex.hasMatch(phoneNumber ?? '');
    if (!isPhoneNumberValid) {
      return 'Please enter a valid Philippine phone number';
    }
    return null;
  }

  bool validateFiles() {
    for (int i = 0; i < _fileNameList.length; i++) {
      if (_fileNameList[i] == null) {
        return false;
      }
    }
    return true;
  }

  String? validateDropdown(
      String? value, String fieldName, List<String> option) {
    if (value == null || value == option[0]) {
      return 'Please select $fieldName';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              activeStep = 0;
            });
          },
        ),
        title: const Text('MCAT Admission'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF006699),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            for (int i = 0; i < title.length - 1; i++)
                              Expanded(
                                child: Row(
                                  children: [
                                    circleStepper(i),
                                    Expanded(child: lineStepper(i))
                                  ],
                                ),
                              ),
                            circleStepper(title.length - 1)
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          for (int i = 0; i <= title.length; i++)
                            if (i == activeStep)
                              Expanded(child: stepperTitle(i)),
                        ],
                      ))
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    activeStep == 0
                        ? step1()
                        : activeStep == 1
                            ? step2()
                            : activeStep == 2
                                ? step3()
                                : activeStep == 3
                                    ? step4()
                                    : activeStep == 4
                                        ? step5()
                                        : step6()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget step1() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          customTextField(
            'Last Name',
            'Enter Last Name',
            controllers[0],
            texts[0],
            TextInputType.name,
            (name) => name!.isEmpty ? "Last name should not be empty" : null,
            null,
          ),
          customTextField(
            'First Name',
            'Enter First Name',
            controllers[1],
            texts[1],
            TextInputType.name,
            (name) => name!.isEmpty ? "First name should not be empty" : null,
            null,
          ),
          customTextField(
            'Middle Name',
            'Enter Middle Name',
            controllers[2],
            texts[2],
            TextInputType.name,
            null,
            null,
          ),
          customDropDown(
            'Name Extension',
            'Select Name Extension',
            selectedNameExt,
            nameExtList,
            (newValue) {
              setState(() {
                newValue != nameExtList[0]
                    ? selectedNameExt = newValue
                    : selectedNameExt = null;
              });
            },
            validation: null,
          ),
          customTextField(
            'Maiden Name',
            'Enter Maiden Name',
            controllers[4],
            texts[4],
            TextInputType.name,
            null,
            null,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: 80,
              child: InkWell(
                onTap: () => selectBirthDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    labelText: 'Birthdate',
                    suffixIcon: const Icon(Icons.calendar_today),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF006699), width: 2.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF006699), width: 2.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    errorText: selectedBirthDate == null && showErrors
                        ? 'Birthdate should not be empty'
                        : null,
                    errorStyle: const TextStyle(fontSize: 12, height: 1.0),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 12.0),
                  ),
                  child: Text(
                    selectedBirthDate != null
                        ? DateFormat('yyyy-MM-dd').format(selectedBirthDate!)
                        : 'Select Date',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 80,
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Sex',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF006699), width: 2.0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF006699), width: 2.0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: selectedSex == null && showErrors
                      ? 'Please select sex'
                      : null,
                  errorStyle: const TextStyle(fontSize: 12, height: 1.0),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: selectedSex,
                      onChanged: (String? value) {
                        setState(() {
                          selectedSex = value;
                        });
                      },
                    ),
                    const Text('Male'),
                    const SizedBox(width: 40),
                    Radio<String>(
                      value: 'Female',
                      groupValue: selectedSex,
                      onChanged: (String? value) {
                        setState(() {
                          selectedSex = value;
                        });
                      },
                    ),
                    const Text('Female'),
                  ],
                ),
              ),
            ),
          ),
          customDropDown(
            'Civil Status',
            'Select Civil Status',
            selectedCivilStatus,
            civilStatusOptions,
            (newValue) {
              setState(() {
                newValue != civilStatusOptions[0]
                    ? selectedCivilStatus = newValue
                    : selectedCivilStatus = null;
              });
            },
            validation: (value) =>
                validateDropdown(value, 'Civil Status', civilStatusOptions),
          ),
          customTextField(
            'Landline Number',
            'Enter Landline Number',
            controllers[8],
            texts[8],
            TextInputType.phone,
            null,
            null,
          ),
          customTextField(
            'Cellphone Number',
            'Enter Cellphone Number',
            controllers[9],
            texts[9],
            TextInputType.phone,
            validatePhoneNumber,
            null,
          ),
          customTextField(
            'Email Address',
            'Enter Email Address',
            controllers[10],
            texts[10],
            TextInputType.emailAddress,
            validateEmail,
            null,
          ),
          proceedButton(),
        ],
      ),
    );
  }

  Widget step2() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          customTextField(
            'Home Address',
            'House Number/Street/Village/Subdivision/Compound',
            controllers[11],
            texts[11],
            TextInputType.streetAddress,
            (address) =>
                address!.isEmpty ? "Home Address should not be empty" : null,
            null,
          ),
          customDropDown(
            'Region',
            'Select Region',
            selectedRegion,
            regionList,
            (newValue) {
              setState(() {
                newValue != regionList[0]
                    ? selectedRegion = newValue
                    : selectedRegion = null;
              });
            },
            validation: (value) =>
                validateDropdown(value, 'Region', regionList),
          ),
          customDropDown(
            'Province',
            'Select Province',
            selectedProvince,
            provinceList,
            (newValue) {
              setState(() {
                newValue != provinceList[0]
                    ? selectedProvince = newValue
                    : selectedProvince = null;
              });
            },
            validation: (value) =>
                validateDropdown(value, 'Province', provinceList),
          ),
          customDropDown(
            'City/Municipality',
            'Select City/Municipality',
            selectedCity,
            cityMunicipality,
            (newValue) {
              setState(() {
                newValue != cityMunicipality[0]
                    ? selectedCity = newValue
                    : selectedCity = null;
              });
            },
            validation: (value) =>
                validateDropdown(value, 'City/Municipality', cityMunicipality),
          ),
          customTextField(
            'Barangay',
            'Enter Barangay',
            controllers[15],
            texts[15],
            TextInputType.streetAddress,
            (barangay) =>
                barangay!.isEmpty ? "Barangay should not be empty" : null,
            null,
          ),
          customTextField(
              'Zip Code',
              'Enter Zip Code',
              controllers[16],
              texts[16],
              TextInputType.number,
              (zipCode) =>
                  zipCode!.length < 4 ? "Zip Code consists of 4-digit" : null,
              4),
          proceedButton(),
        ],
      ),
    );
  }

  Widget step3() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Name and Complete Address of Tertiary School Graduated From and Course Obtained',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
          customTextField(
            'College/University',
            'Enter College/University',
            controllers[17],
            texts[17],
            TextInputType.text,
            (college) => college!.isEmpty
                ? "College/University should not be empty"
                : null,
            null,
          ),
          customTextField(
            'College Address',
            'Enter College Address',
            controllers[18],
            texts[18],
            TextInputType.text,
            (collegeAdd) => collegeAdd!.isEmpty
                ? "College/University Address should not be empty"
                : null,
            null,
          ),
          customTextField(
            'Course',
            'Enter Course',
            controllers[19],
            texts[19],
            TextInputType.text,
            (course) => course!.isEmpty ? "Course should not be empty" : null,
            null,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: 80, // Set the consistent height including the error text
              child: InkWell(
                onTap: () => selectNmatDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    labelText: 'NMAT Date',
                    suffixIcon: const Icon(Icons.calendar_today),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF006699), width: 2.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF006699), width: 2.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    errorText: selectedNmatDate == null && showErrors
                        ? 'NMAT Date should not be empty'
                        : null,
                    errorStyle: const TextStyle(
                        fontSize: 12,
                        height: 1.0), // Adjust the height of the error text
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 12.0), // Ensure consistent padding
                  ),
                  child: Text(
                    selectedNmatDate != null
                        ? DateFormat('yyyy-MM-dd').format(selectedNmatDate!)
                        : 'Select Date',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          customTextField(
            'NMAT Score',
            'Enter NMAT Score',
            controllers[20],
            texts[20],
            TextInputType.number,
            (nmatScore) =>
                nmatScore!.isEmpty ? "NMAT Score should not be empty" : null,
            null,
          ),
          customTextField(
            'GWA',
            "Enter GWA (Bachelor's Degree)",
            controllers[21],
            texts[21],
            TextInputType.number,
            (gwa) => gwa!.isEmpty ? "GWA should not be empty" : null,
            null,
          ),
          proceedButton()
        ],
      ),
    );
  }

  Widget step4() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'The total size of ALL files to be uploaded must not exceed 15 MB (Megabytes).',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ),
        buildFilePicker(
            'Official Transcript of Records/Certification of Grades (PDF/JPG)',
            0),
        buildFilePicker(
            'Certificate of General Weighted Average/GWA of Subjects (PDF/JPG)',
            1),
        buildFilePicker('NMAT Result (PDF/JPG)', 2),
        buildFilePicker(
            'Form 137 (For undergraduates who have taken Grade 11 & 12) (PDF/JPG)',
            3),
        buildFilePicker(
            'Voters Certification of Registration with voting history (For Manileño Only) (PDF/JPG)',
            4),
        buildFilePicker('Vaccination Card - 2 Doses (PDF/JPG)', 5),
        proceedButton(),
      ],
    );
  }

  Widget step5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'I hereby certify that the information provided above is true and correct'
          ' based on my personal knowledge and available records. Providing false and innacurate'
          ' information may be ground for disqualification from the University.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Checkbox(
                value: isSubmitting,
                onChanged: (value) {
                  setState(() {
                    isSubmitting = value!;
                    debugPrint(isSubmitting.toString());
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'I Submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        const Text(
          'By clicking the "Next" button, you have fully understood and agreed to the Data Privacy Act 10173. '
          'You will proceed to confirmation step to verify data inputted is correct.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: 'For any inquiry, email at: ',
                  style: TextStyle(fontSize: 16)),
              TextSpan(
                  text: 'mcat@plm.edu.ph',
                  style: TextStyle(
                      color: Color(0xFF3B82F6),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF3B82F6)))
            ]),
          ),
        ),
        proceedButton()
      ],
    );
  }

  Widget step6() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        displayFields('LAST NAME: ', texts[0]),
        displayFields('FIRST NAME: ', texts[1]),
        displayFields('MIDDLE NAME: ', texts[2]),
        displayFields('NAME EXTENSION: ',
            nameExtList.contains(selectedNameExt) ? selectedNameExt : 'N/A'),
        displayFields('MAIDEN NAME: ', texts[4]),
        displayFields(
            'BIRTHDATE: ', selectedBirthDate.toString().split(' ')[0]),
        displayFields('SEX: ', selectedSex),
        displayFields('CIVIL STATUS: ', selectedCivilStatus),
        displayFields('LANDLINE NUMBER: ', texts[8]),
        displayFields('CELLPHONE NUMBER: ', texts[9]),
        displayFields('EMAIL ADDRESS: ', texts[10]),
        displayFields('HOME ADDRESS: ', texts[11]),
        displayFields('REGION: ', selectedRegion),
        displayFields('PROVINCE: ', selectedProvince),
        displayFields('CITY/MUNICIPALITY: ', selectedCity),
        displayFields('BARANGAY: ', texts[15]),
        displayFields('ZIP CODE: ', texts[16]),
        displayFields('COLLEGE/UNIVERSITY NAME: ', texts[17]),
        displayFields('COLLEGE/UNIVERSITY ADDRESS: ', texts[18]),
        displayFields('COURSE: ', texts[19]),
        displayFields('NMAT DATE: ', selectedNmatDate.toString().split(' ')[0]),
        displayFields('NMAT SCORE: ', texts[20]),
        displayFields("GWA (BACHELOR'S DEGREE): ", texts[21]),
        proceedButton(),
      ],
    );
  }

  Widget customDropDown(
    String labelText,
    String hintText,
    String? selectedValue,
    List<String> listOptions,
    Function(String?) onChanged, {
    String? Function(String?)? validation,
    bool showError = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 80,
        child: FormField<String>(
          initialValue: selectedValue,
          validator: (value) {
            if (showErrors &&
                (value == null || value.isEmpty || value == listOptions[0])) {
              return 'Please select $labelText';
            }
            return null;
          },
          autovalidateMode:
              showErrors ? AutovalidateMode.always : AutovalidateMode.disabled,
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                labelText: labelText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF006699), width: 2.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF006699), width: 2.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorText: showError ? state.errorText : null,
                errorStyle: const TextStyle(fontSize: 12, height: 1.0),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 12.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(16),
                  value: selectedValue,
                  onChanged: (newValue) {
                    onChanged(newValue);
                    state.didChange(newValue);
                  },
                  items: listOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(
                        option,
                        textAlign: TextAlign.left,
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                  hint: Text(hintText),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget displayFields(String header, String? info) {
    return SizedBox(
      height: 30,
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: header,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextSpan(text: info)
      ])),
    );
  }

  Widget proceedButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFF4F4F5)),
                    foregroundColor:
                        MaterialStatePropertyAll(Color(0xFF71717A)),
                  ),
                  onPressed: () {
                    setState(() {
                      activeStep > 0 ? activeStep -= 1 : activeStep = 0;
                    });
                  },
                  child: activeStep == 0
                      ? const Text('Cancel')
                      : const Text('Back'),
                ),
              ),
              const SizedBox(width: 20),
              activeStep < 3
                  ? SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF006699)),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            if ((activeStep == 0 &&
                                    selectedBirthDate == null) ||
                                (activeStep == 2 && selectedNmatDate == null)) {
                              setState(() {
                                showErrors = true;
                              });
                            } else {
                              setState(() {
                                if (activeStep < 5) {
                                  activeStep += 1;
                                  showErrors = false;
                                } else {
                                  // Submit form
                                  showErrors = false;
                                }
                              });
                            }
                          } else {
                            setState(() {
                              showErrors = true;
                            });
                          }
                        },
                        child: const Text('Next'),
                      ),
                    )
                  : activeStep == 3
                      ? SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF006699)),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: () {
                              if (validateFiles()) {
                                setState(() {
                                  activeStep += 1;
                                  showErrors = false;
                                });
                              } else {
                                setState(() {
                                  showErrors = true;
                                });
                              }
                            },
                            child: const Text('Next'),
                          ),
                        )
                      : activeStep == 4
                          ? SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFF006699)),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (isSubmitting) {
                                      activeStep += 1;
                                    }
                                  });
                                },
                                child: activeStep < 5
                                    ? const Text('Next')
                                    : const Text('Submit'),
                              ),
                            )
                          : SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFF006699)),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('NMAT Admission'),
                                    content: const Text(
                                        'You have completed NMAT Admission!'),
                                    actions: [
                                      Center(
                                        child: TextButton(
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                              Color(0xFF006699),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              activeStep = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Go to Dashboard',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                child: const Text('Submit'),
                              ),
                            ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget customTextField(
    String labelText,
    String hintText,
    TextEditingController controller,
    String text,
    TextInputType keyboardType,
    String? Function(String?)? validation,
    int? maxLength,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 80, // Set the consistent height including the error text
        child: TextFormField(
          controller: controller,
          showCursor: true,
          onChanged: (newValue) {
            setState(() {
              texts[controllers.indexOf(controller)] = newValue;
            });
          },
          maxLength: maxLength,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFF006699), width: 2.0),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFF006699), width: 2.0),
              borderRadius: BorderRadius.circular(16),
            ),
            errorStyle: const TextStyle(
                fontSize: 12,
                height: 1.0), // Adjust the height of the error text
            contentPadding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 12.0), // Ensure consistent padding
          ),
          validator: validation,
        ),
      ),
    );
  }

  Widget buildFilePicker(String label, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF006699)),
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF006699)),
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color(0xFF006699),
                  ),
                  child: TextButton.icon(
                    onPressed: () => uploadFile(index),
                    icon: const Icon(
                      Icons.upload,
                      color: Colors.white,
                    ),
                    label: Text(
                      _fileNameList[index] ?? 'Upload File',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
              if (_fileNameList[index] == null && showErrors)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Please upload a file',
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void uploadFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg'],
    );

    if (!mounted) return;

    if (result != null) {
      File file = File(result.files.first.path!);
      int fileSize = await file.length();

      if (fileSize <= 15 * 1024 * 1024) {
        if (!mounted) return;
        setState(() {
          _fileNameList[index] = result.files.first.name;
        });
      } else {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('File Size Limit Exceeded'),
              content: const Text('The file size exceeds the limit of 15 MB.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      if (!mounted) return;
      setState(() {
        _fileNameList[index] = null;
      });
    }
  }

  void selectBirthDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedBirthDate = pickedDate;
      });
    }
  }

  void selectNmatDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedNmatDate = pickedDate;
      });
    }
  }

  Widget stepperTitle(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Step ${index + 1}',
          style: TextStyle(
            color: Colors.black.withOpacity(0.3),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title.elementAt(index),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget lineStepper(int index) {
    return Container(
      width: double.infinity,
      height: 5,
      color: index < activeStep
          ? const Color(0xFF006699)
          : const Color(0xFF006699).withOpacity(0.2),
    );
  }

  Widget circleStepper(int index) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.5),
        border: Border.all(
          color: index > activeStep
              ? const Color(0xFF006699).withOpacity(0.1)
              : const Color(0xFF006699),
          width: 2,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Container(
          margin: EdgeInsets.all(index == activeStep ? 2 : 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index > activeStep
                ? const Color(0xFF006699).withOpacity(0.1)
                : const Color(0xFF006699),
          ),
          child: activeStep > index
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )
              : Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.5),
                    border:
                        Border.all(color: const Color(0xFF006699), width: 1),
                  ),
                )),
    );
  }
}