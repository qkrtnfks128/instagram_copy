import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopPageController extends GetxController{
  final firestore = FirebaseFirestore.instance;

  getData() async {
    print('firebase 데이터 가져오기 시작');
    var result= await firestore.collection('product').doc('QBcLaMAw98hcBYz2DdUJ').get();
    print(result);
    print('firebase 데이터 가져오기 완료');
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}