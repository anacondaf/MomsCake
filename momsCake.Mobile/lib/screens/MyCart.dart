import "package:flutter/material.dart";

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartState();
}

class _MyCartState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/svg/category_croissant.jpg"),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Wing Chair"),
                          Icon(Icons.close),
                        ],
                      ),
                      Text("Free Shipping"),
                      Row(
                        children: [
                          Text("\$410"),
                          Row(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                child: Text("-"),
                              ),
                              Text("01"),
                              Container(
                                width: 64,
                                height: 64,
                                child: Text("+"),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
