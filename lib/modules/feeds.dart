import 'package:flutter/material.dart';
class FeedScreen extends StatelessWidget {
  // const FeedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                   children: [
                     Image(
                       image: NetworkImage(
                        'https://img.freepik.com/free-photo/portrait-cat-astronaut-helmet_384344-5221.jpg?t=st=1707160094~exp=1707163694~hmac=ab559e8374ca1ce18fd851fa99e8074ec97e6a01e0b87d236703251f12a0e03e&w=1380'
                       ),
                       fit: BoxFit.cover,
                       height: 200,
                       width: double.maxFinite,
                     ),
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Text(
                           'Cat Platform',
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w800,
                           fontSize: 12,
                         ),
                       ),
                     ),
                   ],
                ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              margin: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/astronaut-cat-astronaut-suit_384344-5110.jpg?t=st=1707160680~exp=1707164280~hmac=7def2662e4fc3c1f50113d2e73d3717f751f03ac154333a21b8a62567c2d5095&w=1380'
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Mas3od',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 1.3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                    size: 16,
                                  )
                                ],
                              ),
                              Text(
                                '05 Feb , 2024 09:20 PM',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz,size: 16,))
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    Text(
                      'Cats, with their graceful movements and enigmatic personalities, have been cherished companions to humans for centuries. These feline creatures captivate us with their sleek fur, mesmerizing eyes, and the soothing purr that seems to effortlessly convey a sense of contentment. Cats embody a unique blend of independence and affection, often choosing the perfect balance between playfulness and moments of serene repose. Whether curling up in a sunlit spot for a nap or engaging in a playful chase with a dangling toy, cats bring joy and comfort to our lives. Their mysterious nature adds an air of intrigue, making them subjects of admiration, folklore, and Internet fascination alike. As silent observers and loyal confidantes, cats have earned a special place in our hearts, leaving an indelible mark on the tapestry of human-animal companionship.',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis
                      ),
                      maxLines: 5,
                    ),
                    Container(
                      width: double.infinity,
                      child: Wrap(
                        children: [
                          Container(
                            height: 25,
                            child: MaterialButton(
                              minWidth: 1,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Text('#cats',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                            child: MaterialButton(
                              minWidth: 1,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Text('#cats_heads',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://img.freepik.com/free-photo/three-cats-red-jacket-sunglasses-dark-background_384344-5042.jpg?t=st=1707163879~exp=1707167479~hmac=7b8130245446db97d628993181f20f918eb0c3e0844ada675b9126bf5c36c599&w=1380'
                            ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.heart_broken,
                                  size: 16,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 5,),
                                  Text('120 Comments',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),

                                  )
                                ],
                              ),
                              ),
                              onTap: (){},

                            )
                        ),
                        Expanded(
                            child: InkWell(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.chat,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(width: 5,),
                                    Text('120 Comments',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),

                                    )
                                  ],
                                ),
                              ),
                              onTap: (){},

                            )
                        ),
                      ],
                    ),
                    Padding(padding:
                    EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/portrait-cat-wearing-scarf-his-head-shop_384344-5309.jpg?t=st=1707166172~exp=1707169772~hmac=c3ef751209412d75da66d9137df6ade21a75a0fa66b410194985c59d39bc5580&w=1380'
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text(
                            'Write a comment ....'
                        ),

                      ],
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}