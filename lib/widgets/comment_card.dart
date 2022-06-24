import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({Key? key, this.snap}) : super(key: key);

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
              widget.snap['profilePic'],
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
                      text: widget.snap['username'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${widget.snap['text']}',
                      
                    ),
                  
                  ]
                ),
                ),
                Padding(padding: const EdgeInsets.only(top: 4),
                child: Text(DateFormat.yMMMd().format(widget.snap['dataPublished'].toDate()),
                style:const TextStyle(fontSize: 12),),
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