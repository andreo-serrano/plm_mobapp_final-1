// ignore_for_file: must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonFill extends StatelessWidget {
  String buttonText;
  Color color, bgColor;
  void Function()? onPressed;

  ButtonFill({super.key, 
    
    required this.buttonText,
    this.color = Colors.black,
    this.bgColor = Colors.amber,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: bgColor,
            elevation: 5,
            fixedSize: Size(screenWidth * 90, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(buttonText, style: TextStyle(color: color),
        ),
      ),
    );
  }
}

class ButtonOutline extends StatelessWidget {
  String buttonText;
  Color color;
  void Function()? onPressed;

  ButtonOutline ({super.key, 
    
    required this.buttonText,
    this.color = Colors.black,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.amber,
            side: BorderSide(color: color),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            elevation: 5,
            fixedSize: Size(screenWidth * 90, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(buttonText, style: TextStyle(color: color),
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  ButtonIcon({super.key, 
    
    required this.buttonName,
    required this.icon,
    required this.onPressed
  });

  String buttonName;
  IconData icon;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(80, 85),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(5),
        elevation: 0,
        // backgroundColor: Theme.of(context).colorScheme.secondary, // <-- Button color
        foregroundColor: const Color(0xFFEEBB05), // <-- Splash color
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 40, width: 40, child: Center(child: Icon(icon, size: 26))),
        const SizedBox(height: 3.0),
        Text(buttonName,textAlign: TextAlign.center, style: const TextStyle(fontSize: 10)),
      ]),
    );
  }
}

class ButtonText extends StatelessWidget {
  ButtonText({super.key, 
    
    required this.text,
    required this.icon,
    required this.onPressed
  });

  Widget text;
  IconData icon;
  void Function()? onPressed;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Center(
        child: TextButton(
            style: flatButtonStyle,
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        text,
                        Icon(icon),
                      ]),
                ],
              ),
            )
        ),
      ),
    );
  }
}



