import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key,required this.data,required this.getMoreList}) : super(key: key);
 final List data;
 final Function(List) getMoreList;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///스크롤 컨트롤러
  final _scrollController=ScrollController();


  getData() async {
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/more1.json') );
    late List _showMoreList=[];
    if (result.statusCode == 200) {
      setState(() {
        _showMoreList..add(jsonDecode(result.body));

      });
      widget.getMoreList(_showMoreList);
    } else {
      throw Exception('실패함ㅅㄱ');
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        print('맨 끝입니다');
        getData();

      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      if(widget.data.isNotEmpty){
        return ListView.builder(
          controller:_scrollController ,
          itemCount: widget.data.length,
          itemBuilder: (c, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.data[i]['image'].runtimeType!=String? Image.file(widget.data[i]['image'],height:300,width: double.infinity,fit: BoxFit.cover,):Image.network(
                  widget.data[i]['image'],height:300,width: double.infinity,fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '좋아요 ${widget.data[i]['likes']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${widget.data[i]['user'] }'),
                Text('${widget.data[i]['content'] }'),
                SizedBox(
                  height: 15,
                ),
              ],
            );
          },
        );
      }
      else{
        return Center(child:Padding(
          padding: const EdgeInsets.all(100),
          child: LoadingIndicator(
              indicatorType: Indicator.ballRotateChase,  /// Optional, the stroke backgroundColor
          ),
        ));
      }

  }
}
