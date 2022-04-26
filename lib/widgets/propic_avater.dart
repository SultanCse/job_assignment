import 'package:flutter/material.dart';

class PropicAvater extends StatelessWidget {
  const PropicAvater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage('images/propic.png'),
          ),
          Positioned(
            left: 95,
            bottom: 10,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_a_photo),
            ),
          ),
        ],
      ),
    );
  }
}
