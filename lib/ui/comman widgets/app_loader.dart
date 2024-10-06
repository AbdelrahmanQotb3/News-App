import 'package:flutter/material.dart';

class appLoader extends StatelessWidget {
  const appLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}