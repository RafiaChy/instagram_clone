import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1655070748916-75871ab03c87?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
            ),
            radius: 18,
          ),
          Expanded(
            child: Padding(padding: const EdgeInsets.only(left: 16,    
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: 
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'username',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'input description',
                      
                    ),
                  
                  ]
                ),
                ),
                Padding(padding: const EdgeInsets.only(top: 4),
                child: Text('6/15/2022',
                style: TextStyle(fontSize: 12),),
                ),
              ],
            ),
            ),
          ),

              Container(
               padding: const EdgeInsets.all(8), 
               child: Icon(Icons.favorite, size: 16,)
              )
        ]
    
        ),
    );
  }
}