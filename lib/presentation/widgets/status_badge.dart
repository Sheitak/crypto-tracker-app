import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge({Key? key, required this.status}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 'pending':
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4.2),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange.shade900,
                  Colors.orange.shade500,
                  // color.withOpacity(0.7),
                  // color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          child: const Text(
            'Pending',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),
        );
      case 'resolved':
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4.2),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade900,
                  Colors.green.shade500,
                  // color.withOpacity(0.7),
                  // color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          child: const Text(
            'Resolved',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),
        );
      default:
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4.2),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red.shade900,
                  Colors.red.shade500,
                  // color.withOpacity(0.7),
                  // color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          child: const Text(
            'Closed',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),
        );
    }
  }
  
}