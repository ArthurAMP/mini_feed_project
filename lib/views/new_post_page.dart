import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Column(
                    children: [
                      Row(children: [
                        Text("New Post",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Text("To create a new post you need to login first.",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  )),
            ],
          )),
    );
  }
}
