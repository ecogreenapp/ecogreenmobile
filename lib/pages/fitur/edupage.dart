import 'package:flutter/material.dart';

import '../product_detail.dart';

void main() {
  runApp(EduPage());
}

class Product {
  final String name;
  final String description;
  final double price;
  final String detail;
  String imagePath;
  String imageReal;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.detail,
    required this.imagePath,
    required this.imageReal,
  });
}

class EduPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Botol Plastik',
      description: 'Powerful laptop for work and entertainment.',
      price: 1200.0,
      detail:
          'Sampah botol plastik adalah jenis limbah yang berasal dari wadah plastik untuk minuman atau kemasan produk. Meskipun umum digunakan, botol plastik memiliki dampak besar terhadap lingkungan karena sulit terurai. Dengan mendaur ulang botol plastik, kita dapat mengurangi pencemaran lingkungan dan mengurangi kebutuhan bahan baku baru. Mengurangi penggunaan botol plastik sekali pakai dan memilih kemasan ramah lingkungan adalah langkah positif untuk pelestarian lingkungan. Edukasi dan kebiasaan hidup berkelanjutan dapat membantu menjaga kebersihan dan keberlanjutan planet kita.',
      imagePath: 'lib/images/water-bottle.png',
      imageReal: 'lib/images/bottler.jpg',
    ),
    Product(
      name: 'Kardus Bekas',
      description: 'High-end smartphone with amazing features.',
      price: 800.0,
      detail:
          'Limbah kardus bekas adalah sisa dari kemasan atau wadah yang terbuat dari bahan kardus. Kardus bekas sering kali dihasilkan dari kemasan barang-barang seperti elektronik, peralatan rumah tangga, atau pengiriman paket. Dengan mendaur ulang limbah kardus, kita dapat mengurangi jumlah sampah yang masuk ke tempat pembuangan akhir dan menghemat sumber daya alam. Selain mendaur ulang, memanfaatkan kardus bekas untuk proyek kerajinan atau donasi dapat menjadi alternatif kreatif untuk mengurangi dampak lingkungan',
      imagePath: 'lib/images/kardus.png',
      imageReal: 'lib/images/kardusr.jpg',
    ),
    Product(
      name: 'Cup Gelas',
      description: 'Wireless headphones with noise cancellation.',
      price: 150.0,
      detail:
          'Cangkir plastik bekas, atau sering disebut sebagai gelas sekali pakai, adalah limbah yang dihasilkan dari penggunaan cangkir plastik untuk minuman atau kebutuhan sekali pakai lainnya. Limbah ini merupakan masalah lingkungan karena plastik sulit terurai dan dapat mencemari lingkungan. Mengurangi penggunaan cangkir plastik sekali pakai, mendaur ulang, atau mencari alternatif ramah lingkungan dapat membantu mengurangi dampak negatifnya',
      imagePath: 'lib/images/drinks.png',
      imageReal: 'lib/images/cupreal.jpg',
    ),
    Product(
      name: 'Galon',
      description: 'Wireless headphones with noise cancellation.',
      price: 150.0,
      detail:
          'Galon bekas, yang biasanya terbuat dari plastik, adalah limbah yang berasal dari kemasan air minum dalam jumlah besar. Limbah galon plastik dapat mencemari lingkungan jika tidak didaur ulang dengan benar. Melakukan daur ulang galon bekas atau menggantinya dengan opsi kemasan yang lebih ramah lingkungan dapat membantu mengurangi dampak negatifnya',
      imagePath: 'lib/images/water.png',
      imageReal: 'lib/images/gallonreal.jpg',
    ),
    Product(
      name: 'Kaca',
      description: 'Wireless headphones with noise cancellation.',
      price: 150.0,
      detail:
          'Kaca bekas, seperti botol atau pecahan kaca, adalah jenis limbah yang dapat didaur ulang dengan baik. Dengan mendaur ulang kaca, kita dapat mengurangi penggunaan bahan baku baru dan meminimalkan dampak negatif terhadap lingkungan. Penting untuk membuang kaca bekas dengan benar agar dapat diolah kembali dan digunakan dalam siklus produksi yang berkelanjutan',
      imagePath: 'lib/images/glass-bottle.png',
      imageReal: 'lib/images/gbotreal.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 185, 142, 1),
          title: Text('Jenis Sampah'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigasi kembali ke halaman sebelumnya
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItem(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            product.description,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Image.asset(
            product.imagePath,
            width: 100, // Sesuaikan dengan kebutuhan Anda
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman detail produk saat tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(0, 185, 142, 1),
                ),
                child: Text('Read Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
