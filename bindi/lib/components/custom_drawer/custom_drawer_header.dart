import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      height: 95,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(Icons.person,color: Colors.white , size: 35,),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Acesse sua conta agora!', style: TextStyle(color: Colors.white ,fontSize: 16,
                  fontWeight: FontWeight.w500,),),

                Text('Clique aqui!', style: TextStyle(color: Colors.white,
                    fontSize: 16, fontWeight: FontWeight.w400,),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
