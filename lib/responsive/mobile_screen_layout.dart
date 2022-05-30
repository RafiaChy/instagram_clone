import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({ Key? key }) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

 

  // String username = '';
  // @override
  // void initState() {
  //   getUserName();
  //   super.initState();
  // }

  // void getUserName() async {
  //  DocumentSnapshot snap = await FirebaseFirestore.instance.
  //   collection('users').
  //   doc(FirebaseAuth.instance.currentUser!.uid)
  //   .get();

  //   print(snap.data());

  //   setState(() {
      
  //   username = (snap.data() as Map<String, dynamic>)['username'];
  //   });
  // }
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
   int _page = 0;

  void navigationTap(int page){
    pageController.jumpTo(page.toDouble());
  }

  @override
  Widget build(BuildContext context) {
   // model.User user = Provider.of<UserProvider>(context).getUser;
  
    return Scaffold(
      body: PageView(
        children: const [
           Center(child: Text('feed'),),
           Center(child: Text('search'),),
           Center(child: Text('add'),),
           Center(child: Text('notifications'),),
           Center(child: Text('profile'),),
        ],
        controller: pageController,
        onPageChanged: null,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '', backgroundColor: _page == 0? primaryColor : secondaryColor, ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '', backgroundColor:  _page == 1? primaryColor : secondaryColor, ),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: '', backgroundColor:  _page == 2? primaryColor : secondaryColor, ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '', backgroundColor:  _page == 3? primaryColor : secondaryColor, ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '', backgroundColor:  _page == 4? primaryColor : secondaryColor, ),
        ],
      onTap: navigationTap
      ),
    );
  }
}