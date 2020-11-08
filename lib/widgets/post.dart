import 'package:flutter/material.dart';
import 'package:notification/providers/cart.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatelessWidget {

  final String imageUrl;
  final String cakeName;
  final String price;

  PostWidget({this.imageUrl,this.cakeName,this.price = "100"});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(25,0,25,25),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 4)
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImage(context),
           _buildLowerBody(context),
        ],
      ),
    );
  }

 
  Widget _buildImage(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Image.asset(imageUrl, fit: BoxFit.fitWidth,),
      ),
    );
  }

  Widget _buildLowerBody(BuildContext context) {
    final _cartListProvider = Provider.of<CartProvider>(context);
    var _itemQuantity = _cartListProvider.getQuantity(cakeName);
    bool _showQauntity = _cartListProvider.showQuantityController(cakeName);
    return Container(
      padding: EdgeInsets.all(13),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: cakeName,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '''\nRs ''',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: "$price",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18,
                  ),
                ),
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: _showQauntity 
            ? Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle, size: 20, color: Colors.grey[600],), 
                  onPressed: (){_cartListProvider.decreaseCount(cakeName);}),
                Text("$_itemQuantity"),
                IconButton(
                  icon: Icon(Icons.add_circle,size: 20, color: Colors.blueAccent[700],), 
                  onPressed: (){_cartListProvider.increaseCount(cakeName);}),
              ],
            )
            : IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: (){
                _cartListProvider.addToCartList(name:cakeName,price:double.parse(price),quantity: 1);
              },  
            )
            
          )
        ],
      ),  
    );
  }

}