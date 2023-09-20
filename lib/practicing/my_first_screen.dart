import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.lightBlue,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                )
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.lightBlue,
                  width: 50,
                  height: 50,
                )
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.cyan,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.pink,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.green,
                    height: 50,
                    width: 50,
                  )
                ]),
            Container(
              color: Colors.amber,
              height: 30,
              width: 3000,
              child: const Text(
                'O shape esse ano vem!',
                style: TextStyle(color: Colors.black, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // print('Você apertou o botão!');
                },
                child: const Text('Aperte o botão!'))
          ]),
    );
  }
}
