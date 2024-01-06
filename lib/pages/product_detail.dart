import 'package:flutter/material.dart';

import 'fitur/edupage.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        backgroundColor: Color.fromRGBO(0, 185, 142, 1),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/bakg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  product.imageReal,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ZenMaru Gothic',
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 8),
                Text(
                  product.detail,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: 'ZenMaru Gothic',
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 8),
                Text(
                  'Price: \$${product.price}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'ZenMaru Gothic',
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
