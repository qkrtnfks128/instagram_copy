import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
   Upload({Key? key, required this.userImage}) : super(key: key);
  final userImage;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final TextEditingController inputController=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputController.text='';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.black87,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print('저장하기');
              },
              icon: Icon(
                Icons.send,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,height:300,
                    child: Image.file(widget.userImage,fit: BoxFit.cover)),
                SizedBox(height:20),
                TextFormField(
                  controller: inputController,
                  onChanged: (text){
                    setState(() {
                      inputController.text=text;
                    });
                  },
                  decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),borderSide: BorderSide(color:Colors.grey)
                    )
                  ) ,
                ),
              ],
            ),
          ),
        ));
  }
}
