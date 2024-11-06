import 'package:flutter/material.dart';

class ServicesItem extends StatelessWidget {
  final Widget icon;

  final String label;

  const ServicesItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(15),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.purpleAccent.shade100,
                ),
                child: icon),
            SizedBox(
              height: 20,
            ),
            Text(label , style: TextStyle(fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}
