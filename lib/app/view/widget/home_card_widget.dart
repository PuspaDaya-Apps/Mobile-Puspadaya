import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final int number;
  final String description;
  final String highlightText;
  final bool isPositive;
  const HomeCard({
    super.key,
    required this.title,
    required this.number,
    required this.description,
    required this.highlightText,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: const Offset(0, 3),
            color: Colors.black.withValues(alpha: 0.3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            '${number.toString()}',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '${description}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: '${highlightText}',
                  style: TextStyle(
                    color: isPositive ? Colors.green : Colors.red,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
