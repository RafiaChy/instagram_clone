import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class FirestoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
        String description,
        String uid,
        Uint8List file,
        String username,
        String postId,
        String postUrl,
        String profImage,

  ) async{

    String res = 'Some error occured';
    try{
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);
      Post post = Post(description: description, uid: uid, username: username, likes: likes, postId: postId, datePublished: DateTime.now(), postUrl: postUrl, profImage: profImage) 
    }catch(err){

    }
  }
}