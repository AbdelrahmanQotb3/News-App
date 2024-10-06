import 'package:flutter/material.dart';

class appError extends StatelessWidget {
  String error ;
   appError({
    super.key,
    required this.error
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(error),
        ElevatedButton(onPressed: (){}, child: Text("Refresh"))
      ],
    );
  }
}