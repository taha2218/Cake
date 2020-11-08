import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notification/widgets/post.dart';

class CakeSubCategory extends StatefulWidget {

  final String cakeName;
  CakeSubCategory(this.cakeName);

  @override
  _CakeSubCategoryState createState() => _CakeSubCategoryState();
}

class _CakeSubCategoryState extends State<CakeSubCategory> {
  List categories = []; 
  bool isLoading = true;

  void loadData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("/category/regular/${widget.cakeName}").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var categoryItem = querySnapshot.docs[i];
      categories.add(categoryItem.data());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override

  void initState() {
    super.initState();
    loadData();
  }

  Widget build(BuildContext context) {
    print(categories);

    return Container(
      height: double.infinity,                            
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0,15,0,5),
      color: Colors.white,
      child: isLoading 
      ? Center(child: CircularProgressIndicator(),)
      :ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_,index) {
          return PostWidget(imageUrl:"assets/images/Rcake1.jpg",cakeName: categories[index]["name"],price:categories[index]["price"].toString(),);
        }
      )
    );
  }
}