import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (c, i) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey,
              height: 200,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '좋아요 ${i * 100}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('글쓴이'),
            Text('글내용'),
            SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }
}
