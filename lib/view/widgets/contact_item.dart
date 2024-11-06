import 'package:flutter/material.dart';
import 'package:innotech/main.dart';

class ContactItem extends StatelessWidget {
  final String value;

  final String label;

  final Widget icon;

  const ContactItem(
      {super.key,
      required this.value,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 80,
      margin: const EdgeInsets.only(top: 8, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.purpleAccent.shade100,
              borderRadius: BorderRadius.circular(100),
            ),
            height: 50,
            width: 50,
            child: icon,
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
