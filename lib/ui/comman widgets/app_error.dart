import 'package:flutter/material.dart';

class appError extends StatelessWidget {
  String error ;
  final Function? onRefreshClick;
   appError({
    super.key,
    required this.error,
     this.onRefreshClick
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(error),
        ElevatedButton(onPressed: (){
          onRefreshClick?.call();
        }, child: Text("Refresh"))
      ],
    );
  }
}