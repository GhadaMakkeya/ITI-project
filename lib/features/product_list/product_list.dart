import 'package:flutter/material.dart';
import 'package:iti_grad_project/features/product_list/product_list/product_card.dart';



class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});


  List<String> titles =  [
    'Watch',
    'Nike Shoes',
    'LG TV',
    'Airpods',
    'Jacket',
    'Hoodie',
  ];

  final List<String> prices =  [
    '40',
    '430',
    '330',
    '333',
    '50',
    '400',];

  final List<String> images =  [
    'assets/images/watch.png',
    'assets/images/shoes.jpg',
    'assets/images/screen.jpg',
    'assets/images/airpods.jpg',
    'assets/images/jacket.jpg',
    'assets/images/hoodie.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F7),
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: titles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {

            return ProductCard (
              image: images[index],
              title: titles[index],
              price: prices[index],
            );
          },
        ),
      ),
    );
  }
}