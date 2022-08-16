import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  Upload(
      {Key? key,
      required this.userImage,
      required this.getMoreList,
      required this.lastIndex})
      : super(key: key);

  final userImage;
  final Function(List) getMoreList;
  final String lastIndex;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputController.text = '';
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
                UploadValue addList = UploadValue(
                    widget.lastIndex,
                    widget.userImage,
                    0,
                    'May 5',
                    inputController.text,
                    false,
                    '망키');

                print(addList.toJson());
                // widget.getMoreList(_showMoreList);
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
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.file(widget.userImage, fit: BoxFit.cover)),
                SizedBox(height: 20),
                TextFormField(
                  controller: inputController,
                  onChanged: (text) {
                    setState(() {
                      inputController.text = text;
                    });
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ],
            ),
          ),
        ));
  }
}

class UploadValue {
  String id;
  dynamic image;
  int likes;
  String date;
  String content;
  bool liked;
  String user;

  UploadValue(this.id, this.image, this.likes, this.date, this.content,
      this.liked, this.user);

  UploadValue.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'],
        likes = json['likes'],
        date = json['date'],
        content = json['content'],
        liked = json['liked'],
        user = json['user'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'likes': likes,
        'date': date,
        'content': content,
        'liked': liked,
        'user': user,
      };
}
