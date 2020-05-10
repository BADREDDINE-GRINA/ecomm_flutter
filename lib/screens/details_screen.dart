import 'package:ecomflutter/constants.dart';
import 'package:ecomflutter/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter/models/shoe_model.dart';
import 'dart:math' as math;

class DetailScreen extends StatefulWidget {
  final ShoeModel shoeModel;
  DetailScreen({this.shoeModel});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
        backgroundColor: widget.shoeModel.color,
        elevation: 0,
        title: Text("Amanar Produit"),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .75,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(
                      cornerSize: 50,
                      diagonalHeight: 180,
                      roundedButton: false),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 180, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 300,
                          //  padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            '${widget.shoeModel.name}',
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Details :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "${widget.shoeModel.desc}",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        SizedBox(
                          height: 24,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: _buildNavigationBar(),
              bottom: 0,
            ),
            Positioned(
              top: 5,
              left: 150,
              child: Hero(
                tag: '${widget.shoeModel.imgPath}',
                child: Transform.rotate(
                  angle: -math.pi/12,

                  child: Image(
                    width: MediaQuery.of(context).size.width*.75,
                    image: AssetImage("images/${widget.shoeModel.imgPath}"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Price',
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
              Text(
                "\$${widget.shoeModel.price.toInt()}",
                style: TextStyle(
                  //color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text(
              'Ajouter à la carte',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Container _buildColorOptions(color) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }
}
