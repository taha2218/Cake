import 'package:flutter/material.dart';
import 'package:notification/screens/gallery/Sub%20Gallery/cake.dart';
import 'package:notification/screens/gallery/Sub%20Gallery/cake4.dart';
import 'package:notification/screens/gallery/Sub%20Gallery/sub2.dart';
import 'package:notification/screens/gallery/Sub%20Gallery/sub3.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildTabBar(context),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(text: "Cake",),
              Tab(text: "Dessert",),
              Tab(text: "Drinks",),
              Tab(text: "Orders",),
            ],
            labelColor: Colors.grey[900],
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[900],
                  width: 3
                ),
              )
            ),
          ),
          body:TabBarView(
            children: [
              CakeSubGallery(),
              SubTwo(),
              SubThree(),
              SubFour(),
            ],
          ),
        ),
      ),
    );
  }

}