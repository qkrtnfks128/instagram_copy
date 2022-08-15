import 'package:flutter/material.dart';


class Upload extends StatelessWidget {
  const Upload({Key? key,required this.userImage}) : super(key: key);
  final userImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      },icon: Icon(Icons.close,color: Colors.black87,),) ,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImage),
          Text('이미지 업로드 화면'),

        ],
      )

    );
  }
}
