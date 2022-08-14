import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';

class Home extends StatelessWidget {
  const Home({Key? key,required this.data}) : super(key: key);
 final List data;



  @override
  Widget build(BuildContext context) {

      if(data.isNotEmpty){
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (c, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  data[i]['image'],height:300,width: double.infinity,fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '좋아요 ${i * data[i]['likes']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${data[i]['user'] }'),
                Text('${data[i]['content'] }'),
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
