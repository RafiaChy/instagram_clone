import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file ;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage(
    String uid,
    String username,
    String profilePhotoUrl
  ) async {
    try{

    }catch(e){
      
    }
  }
  _selectImage(BuildContext context) async {
    return showDialog(context: context,
     builder: (context){
       return SimpleDialog(
         title: const Text('Create a post'),
         children: [
           SimpleDialogOption(
             padding: const EdgeInsets.all(20),
             child: const Text('Take a photo'),
             onPressed: () async{
               Navigator.of(context).pop();
               Uint8List file = await pickImage(ImageSource.camera);
               setState(() {
                 _file = file;
               });
             },
           ),
            SimpleDialogOption(
             padding: const EdgeInsets.all(20),
             child: const Text('Choose from gallery'),
             onPressed: () async{
               Navigator.of(context).pop();
               Uint8List file = await pickImage(ImageSource.gallery);
               setState(() {
                 _file = file;
               });
             },
           ),
             SimpleDialogOption(
             padding: const EdgeInsets.all(20),
             child: const Text('Cancel'),
             onPressed: () {
               Navigator.of(context).pop();
               
             },
           )
         ],
       );
     } 
     );
  }
  @override
  void dispose() {
   _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file == null ?Center(
      child: IconButton(onPressed: () =>_selectImage(context), icon: Icon(Icons.upload)))
   :Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){},),
        title: const Text('Post To'),
        centerTitle: false,
        actions: [
          TextButton(onPressed: () {
            postImage();
          }, 
          child: const Text('Post', 
          style: TextStyle(color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          ),
          ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.profilePhotoUrl),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Write a caption...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487/451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: MemoryImage(_file!),
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter,
                      )
                    ),
                  ),
                  ),
              ),

            ],
          )
        ],
      ),
    );
  }
}