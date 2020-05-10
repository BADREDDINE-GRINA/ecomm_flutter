import 'package:flutter/material.dart';
import 'package:ecomflutter/constants.dart';

class ShoeModel{
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({this.name,this.brand,this.color,this.desc,this.imgPath,this.price});

  static List<ShoeModel> list=[
    ShoeModel(
      name:"huile de figues de barbarie",
      desc: "Sa richesse en vitamine E, en oméga-6 et en stérols fait de cette huile précieuse un ingrédient exceptionnel pour lutter contre les signes du vieillissement cutané. Elle fait merveille pour maintenir la souplesse et la tonicité de la peau.",
      price: 35,
      color: AppColors.esColor,
      brand:'Amanar',
      imgPath: "barbarie1.png",

    ),
    ShoeModel(
      name:"Huile de  nigelle -السانوش",
      desc: "La coopérative Amanar est une coopérative féminine qui produit l'huile d'Argan et dérivés, huile de figue de barbarie, huile de sésame...",
      price: 20,
      color: AppColors.marronColor,
      brand:'Amanar',
      imgPath: "huile-de-haba.png",

    ),
    ShoeModel(
      name:"huile de graines de citrouille",
      desc: "L'huile de pépins de citrouille est riche en phytoœstrogènes, ce qui peut favoriser l'augmentation du « bon cholestérol » en même temps qu'une réduction de la tension artérielle, des bouffées de chaleur, des maux de tête, des douleurs articulaires et d'autres symptômes de la ménopause.",
      price: 50,
      color: AppColors.yellowColor,
      brand:'Amanar',
      imgPath: "huile.png",

    ),
  ];
}