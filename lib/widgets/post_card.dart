

import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        //HEADER SECTION
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1654796572930-2cfe46670b2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'),

                ),
                Expanded(child: Padding(padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('username', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                )
                ,),
                ),
              IconButton(onPressed: (){
                showDialog(context: context, builder:(context)=>
                Dialog(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shrinkWrap: true,
                    children: [
                      'Delete',
                    ].map((e) => InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Text(e),
                      ),
                      onTap: (){},
                    ),
                    ).toList()
                  ),
                ));
              }, icon: Icon(Icons.more_vert))
              ],
              
            ),  
          ),
          //IMAGE SECTION
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network('https://images.unsplash.com/photo-1654847129539-3ef544f24036?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
            fit: BoxFit.cover,),
          ),
          //LIKE COMMENT SHARE SECTION
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: Colors.red)),
              IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined, )),
              IconButton(onPressed: (){}, icon: Icon(Icons.send, )),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined),),
                  ),
               ),
            ],
          ),
          //DESCRIPTION NUMBER OF COMMENTS
          Container(
            padding: const EdgeInsets.symmetric(
            horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w800),
                child: Text('1,231 likes', style: Theme.of(context).textTheme.bodyText2,),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: primaryColor
                      ) ,
                      children: [
                        TextSpan(
                          text: 'Username',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                          TextSpan(
                          text: ' Hey this is a description to be replaced',
                          
                        ),
                      ]
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    child: Text('View all 200 comments', style: const TextStyle(
                      fontSize: 16,
                      color: secondaryColor,
                    ),) ,
                  ),
                ),

                Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    child: Text('6/11/2022', style: const TextStyle(
                      fontSize: 16,
                      color: secondaryColor,
                    ),) ,
                  ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}