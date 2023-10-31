import 'package:flutter/material.dart';

class Roundbutton extends StatelessWidget {
  final bool loading;
  final String title;
  final VoidCallback onTap;
  const Roundbutton(
      {super.key,
      required this.title,
      required this.onTap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(16)),
        child: loading
            ? CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              )
            : Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
      ),
    );
  }
}
