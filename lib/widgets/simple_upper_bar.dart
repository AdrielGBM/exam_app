import 'package:flutter/material.dart';

class SimpleUpperBar extends StatelessWidget {
  final String screenName;
  final Color color;
  const SimpleUpperBar(
      {super.key, required this.screenName, this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Text(
            screenName,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          const Expanded(
            child: Text(""),
          ),
        ],
      ),
    );
  }
}
