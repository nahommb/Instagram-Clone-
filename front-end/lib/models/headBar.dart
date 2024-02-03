import 'package:flutter/material.dart';
import 'package:leegram/screens/storyScreen.dart';
import 'package:provider/provider.dart';

import '../provider/data.dart';

class HeadBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<data>(context).users;
    final change = Provider.of<data>(context).change;

    return Container(
      // color: Colors.lightBlueAccent,
      height: 100,
      margin: EdgeInsets.only(top: 7),
      // padding: EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=>
            Row(
              children: [
                SizedBox(width: 5,),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        change();
                        Navigator.pushNamed(context, StoriesScreen.routName);
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pink,
                                    Colors.purple,
                                    Colors.orange,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent, // Set as transparent to show the gradient border
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 3,
                              right: 3,
                              top: 3,
                              bottom: 3,
                              child: CircleAvatar(
                                radius: 30,
                                child: ClipOval(child: Image.network("${userData[index].storyImageUrl}$index/300/300",fit: BoxFit.cover,)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                Text('${userData[index].name}')  ],
                ),

              ],
            ),
        itemCount: userData.length,
      ),
    );
  }
}
//https://picsum.photos/300/300