import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {

  final String message;

   ErrorBox({this.message});

  @override
  Widget build(BuildContext context) {
    if(message == null) {
      return Container();
    }else{
      return Container(
        color: Colors.red,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.error_outline,
              color: Colors.white,
              size: 40,),
            SizedBox(width: 16.0
            ),
            Expanded(
                child: Text('Oops! $message. Por favor, tente novamente.',
                  style: TextStyle(color: Colors.white, fontSize: 14.0,),),),
          ],
        ),
      );
    }
  }
}
