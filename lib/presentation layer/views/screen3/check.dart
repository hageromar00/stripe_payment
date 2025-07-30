import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  const Check({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromARGB(255, 224, 222, 222),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              );
  }
}