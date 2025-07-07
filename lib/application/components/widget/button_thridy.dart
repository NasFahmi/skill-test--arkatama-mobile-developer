import 'package:flutter/material.dart';

class ButtonThridy extends StatelessWidget {
  const ButtonThridy({
    super.key,
    required this.mainButtonMessage,
    required this.mainButton,
  });
  final VoidCallback mainButton;
  final String mainButtonMessage;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: mainButton,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(double.infinity, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        mainButtonMessage,
        style: TextStyle(
          color: Color( 0xff333333),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
