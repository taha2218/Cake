import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          _buildLocationDisplay(context),
          _buildRegular(context),
          _buildPremium(context),
          _buildSlider(context),
          _buildSliderOffer(context)
        ],
      ),
    );
  }

  Widget _buildLocationDisplay(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(12, 15, 12, 0),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.location_on,color: Colors.red,),
          Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Text(
              "PIMPRI-CHINCHWAD, PUNE",
              style: GoogleFonts.ubuntu(color: Colors.white.withOpacity(0.8),),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRegular(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.offAndToNamed('/regular');
      },
      child: Container(
        margin: EdgeInsets.only(top: 15,left: 10,right: 10),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(14)
        ),
        height: 120,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    text: "REGULAR",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\nDaily Offers with best prices",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      TextSpan(
                        text: "\n800 Rs / Yearly",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
              ),
              child: Center(child: IconButton(icon: Icon(Icons.navigate_next,size: 30,color: Colors.white.withOpacity(0.8),), onPressed: (){Get.offAndToNamed('/regular');}),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremium(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAndToNamed('/premium');
      },
      child: Container(
        margin: EdgeInsets.only(top: 15,left: 10,right: 10),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(14),
        ),
        height: 120,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    text: "CUSTOM / WALK - IN",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\nCreate & customize your own cake",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                      TextSpan(
                        text: "\n1500 Rs / Yearly",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
              ),
              child: Center(child: IconButton(icon: Icon(Icons.navigate_next,size: 30,color: Colors.white.withOpacity(0.8),), onPressed: (){Get.offAndToNamed('/premium');}),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(10,15,10,0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(220, 220, 220, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Carousel(
            boxFit: BoxFit.cover,
            images: [
              AssetImage("assets/images/cake1.jpg"),
              AssetImage("assets/images/cake3.jpg"),
              ],
            autoplay: true,
            animationCurve: Curves.easeInToLinear,
            animationDuration: Duration(milliseconds: 2500),
            dotSize: 0,
            dotBgColor: Colors.transparent,
            dotColor: Colors.black.withOpacity(0.4),
            dotIncreasedColor: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildSliderOffer(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(10,10,10,10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(220, 220, 220, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Carousel(
            boxFit: BoxFit.cover,
            images: [
              AssetImage("assets/images/cake2.jpg"),
              AssetImage("assets/images/cake4.jpg"),
              AssetImage("assets/images/cake5.jpg"),
            ],
            autoplay: true,
            animationCurve: Curves.easeInToLinear,
            animationDuration: Duration(milliseconds: 2500),
            dotSize: 0,
            dotBgColor: Colors.transparent,
            dotColor: Colors.black.withOpacity(0.4),
            dotIncreasedColor: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

}