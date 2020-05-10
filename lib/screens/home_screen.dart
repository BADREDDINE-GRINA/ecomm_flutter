import 'package:ecomflutter/constants.dart';
import 'package:ecomflutter/models/shoe_model.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter/widgets/app_clipper.dart';
import 'details_screen.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ShoeModel> shoeList = ShoeModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios), color: Colors.black, onPressed: null),
        title: Text('Amanar ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Tendances',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: null)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 300,
            child: ListView.builder(
                itemCount: shoeList.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            shoeModel: shoeList[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.only(right: 16),
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: _buildBackGround(index, 230),
                          ),
                          Positioned(
                            bottom: 70,
                            right: 0,
                            child: Hero(
                              tag: '${shoeList[index].imgPath}',
                              child: Transform.rotate(
                                angle: 0,
                                child: Image(
                                  width: 200,
                                  image: AssetImage(
                                    "images/${shoeList[index].imgPath}",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('display here'),
                Text(
                  'View All',
                  style: TextStyle(
                      color: AppColors.greenColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ...shoeList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(
                      shoeModel:data,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 9.9),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left:8.0),
                        child: Image(
                          image: AssetImage("images/${data.imgPath}"),
                          width: 80,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Text(
                                  "${data.name}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Container(child: Text("${data.brand}")),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "\$${data.price}",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.yellowColor,
        unselectedItemColor: Colors.black12,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.feedback), title: Text('home')),
        ],
      ),
    );
  }

  Widget _buildBackGround(int index, double width) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 180),
      child: Container(
        color: shoeList[index].color,
        width: width,
        //padding: EdgeInsets.all(16),
        child: Stack(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Icon(
                    Icons.details,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  '${shoeList[index].name}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${shoeList[index].price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
