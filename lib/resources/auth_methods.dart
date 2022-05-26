import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String >signUpTheUser({
    required String email,
    required String userName,
    required String password,
    required String bio,
   // required Uint8List file,
  }) async {
    String res = "Some error occured";

    try{
      if(email.isNotEmpty || userName.isNotEmpty || password.isNotEmpty || bio.isNotEmpty 
      //|| file != null
      ){
        
        //register user
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user!.uid);

        //add user to the database
        _firestore.collection("users").doc(userCredential.user!.uid).set({
          'username': userName,
          'uid': userCredential.user!.uid,
          'bio': bio,
          'email': email,
          'followers': [],
          'following': []
        });
        res = "Success!";
      }
    }
    catch(err){
      res = err.toString();
    }
    return res;
  }
}