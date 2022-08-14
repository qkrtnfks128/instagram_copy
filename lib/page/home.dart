import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List showList=[];

  getData() async {
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/data.json') );
    if (result.statusCode == 200) {
       setState(() {
        showList=jsonDecode(result.body);
      });

    } else {
      throw Exception('실패함ㅅㄱ');
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: showList.length,
      itemBuilder: (c, i) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                showList[i]['image'],height:300,width: double.infinity,fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '좋아요 ${i * showList[i]['likes']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${showList[i]['user'] }'),
            Text('${showList[i]['content'] }'),
            SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }
}
