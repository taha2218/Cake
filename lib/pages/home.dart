import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notification/controllers/index.dart';
import 'package:get/get.dart';
import 'package:notification/controllers/user.dart';
import 'package:notification/providers/categories.dart';
import 'package:notification/screens/gallery/gallery.dart';
import 'package:notification/screens/home.dart';
import 'package:notification/screens/screen2.dart';
import 'package:notification/screens/screen3.dart';
import 'package:notification/screens/screen4.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {

  void loadUserData() async {
    final user =  FirebaseAuth.instance.currentUser;
    String uid = user.uid;
    // ignore: deprecated_member_use
    DocumentReference documentReference = FirebaseFirestore.instance.collection('users').document(uid);
    documentReference.get()
    .then(
      (userSnap) {
        //print(userSnap.data());
        final user = userSnap.data();
        final UserController userController = Get.find();
        userController.updateUser(
          name: user["name"],
          contact: user["contact"],
          mail: user["mail"],
          address: user["address"],
        );
      }
    );
  }
  void loadCategories(BuildContext context) {
    // ignore: deprecated_member_use
    CollectionReference collectionReference = Firestore.instance.collection("categories");
    collectionReference.snapshots().listen((snap) {
      // ignore: deprecated_member_use
      var categoriesProvider = Provider.of<CategoriesProvider>(context,listen: false);
      categoriesProvider.clearList();
      // ignore: deprecated_member_use
      for(int i =0;i<snap.documents.length;++i){
        // ignore: deprecated_member_use
        categoriesProvider.loadCategoryNames(snap.documents[i].id);
      }
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    ScreenTwo(),
    ScreenThree(),
    ScreenFour(),
    GalleryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    userController.init();
    loadUserData();
    loadCategories(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.grey[900],
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light
      ),
      child: SafeArea(
        child: GetX<IndexState>(
          init: IndexState(),
          builder: (indexController) => Scaffold(
            drawer: _buildDrawer(context),
            appBar:_buildAppbar(context),
            body: _buildBody(context, indexController),
            bottomNavigationBar: _buildBottomNavBar(context, indexController),
          ),
        ),
      ),
    );  
  }

  Widget _buildDrawer(BuildContext context) {
    final UserController userController = Get.find();
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width/1.3,
      decoration: BoxDecoration(
        color: Colors.grey[900],
      ),
      child: Column(
        children: [
          Container(
            color: Colors.grey[850],
            padding: EdgeInsets.all(12),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(image: AssetImage("assets/images/Rcake2.jpg"),fit: BoxFit.cover)
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.edit,color: Colors.white,),
                        color: Colors.white,
                        onPressed: (){
                          Get.offAndToNamed("/details");  
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(12,0,12,12),
                  child: RichText(
                    text: TextSpan(
                      text: userController.user["name"].toString().toUpperCase(),
                      style: TextStyle(fontSize: 17,color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: "\n${userController.user["contact"]}",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: "\nxyz@gmail.com",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: "\nPune, Maharashtra",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                      ] 
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Material(
                    color: Colors.grey[850],
                    child: InkWell(
                      onTap: () {
                        Get.offAndToNamed('/regular');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.check_circle, size: 24,color: Colors.white,),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text("Regular Orders",style: TextStyle(fontSize: 16,color: Colors.white,),)
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4,),
                  Material(
                    color: Colors.grey[850],
                    child: InkWell(
                      onTap: () {
                        Get.offAndToNamed('/premium');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.check_circle_outline,size: 24,color: Colors.white,),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text("Walk-In Orders",style: TextStyle(fontSize: 16,color: Colors.white,),)
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4,),
                  Material(
                    color: Colors.grey[850],
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/cart');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.add_shopping_cart,size: 24,color: Colors.white,),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text("Cart",style: TextStyle(fontSize: 16,color: Colors.white,),)
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 4,),
          Material(
            color: Colors.grey[850],
            child: InkWell(
              onTap: ()async{
                FirebaseAuth auth = FirebaseAuth.instance;
                await auth.signOut();
                Get.offAndToNamed('/login');
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                color: Colors.transparent,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.exit_to_app,size: 24,color: Colors.white,),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text("Log Out",style: TextStyle(fontSize: 16,color: Colors.white,),)
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {

    return AppBar(
      //automaticallyImplyLeading: false,
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "Franchise",
        style: GoogleFonts.ubuntu(color: Colors.black.withOpacity(0.8),fontSize:20,fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black.withOpacity(0.75),size: 22,), onPressed: () {
          Get.toNamed('/cart');
        })
      ],
    );
  }

  Widget _buildBody(BuildContext context, dynamic indexState) {
    //final IndexState indexState = Get.put(IndexState());
    return _screens[indexState.indexCounter.value]; 
  }  

  Widget _buildBottomNavBar(context, dynamic indexState) {
    int _currentindex = indexState.indexCounter.toInt();
    return BottomNavigationBar(
      // backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.grey[900],
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[600],
      selectedItemColor: Colors.white,
      currentIndex: _currentindex,
      onTap: (value){
        indexState.changeIndex(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 27,),
          title: Text("Home",style: TextStyle(color: Colors.black, fontSize: 11),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted, size: 27), 
          title: Text("Channels",style: TextStyle(color: Colors.black, fontSize: 11),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark, size: 27), 
          title: Text('BookMark',style: TextStyle(color: Colors.black, fontSize: 11),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info, size: 27),
          title: Text('About',style: TextStyle(color: Colors.black, fontSize: 11),)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo, size: 27),
          title: Text('Gallery',style: TextStyle(color: Colors.black, fontSize: 11),)
        ),
      ],
    );
  }

}