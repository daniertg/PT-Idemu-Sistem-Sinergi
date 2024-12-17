import 'package:flutter/material.dart';

void main() => runApp(CartridgeKingsApp());

class CartridgeKingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cartridge Kings',
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu, color: Colors.black),
        ),
        title: Align(
          alignment:
              Alignment(-0.67, 0), // This moves the title to 25% from left
          child: Text(
            'CARTRIDGE KINGS',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Menu Bar
            Container(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Align(
                alignment:
                    Alignment(-0.5, 0), // This moves menu to 25% from left
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuButton(title: 'Home', onPressed: () {}),
                    MenuButton(title: 'Ink Cartridges', onPressed: () {}),
                    MenuButton(title: 'Toner Cartridges', onPressed: () {}),
                    MenuButton(title: 'Contact Us', onPressed: () {}),
                    MenuButton(title: 'Login/Register', onPressed: () {}),
                  ],
                ),
              ),
            ),
            // Banner Section
            Stack(
              children: [
                Image.asset(
                  'assets/banner.png',
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 100,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 25, 25, 25),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(child: buildDropdown('Printer Brand')),
                                SizedBox(width: 8),
                                Expanded(
                                    child: buildDropdown('Printer Series')),
                                SizedBox(width: 8),
                                Expanded(child: buildDropdown('Printer Model')),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'FIND',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Featured Products
            Center(
              child: Container(
                constraints:
                    BoxConstraints(maxWidth: 1000), // Limit width for web
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'FEATURED PRODUCTS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    buildFeaturedProducts(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        filled: true,
        fillColor: Colors.white,
      ),
      items: [],
      onChanged: (value) {},
    );
  }

  Widget buildFeaturedProducts() {
    List<Map<String, dynamic>> products = [
      {
        'name': 'Canon MF-3110 Toner',
        'discountPrice': 5.99,
        'price': 36.45,
        'image': 'assets/canon_toner.png',
        'imageSize': 60.0,
      },
      {
        'name': 'HP 62 Black Ink Cartridge',
        'price': 9.49,
        'discountPrice': 5.99,
        'image': 'assets/canon_toner.png',
        'imageSize': 60.0,
      },
      {
        'name': 'HP 62 Black Ink Cartridge',
        'price': 9.49,
        'discountPrice': 5.99,
        'image': 'assets/canon_toner.png',
        'imageSize': 60.0,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.8,
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          elevation: 1,
          margin: EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    product['image'] ?? '',
                    fit: BoxFit.contain, // Menyesuaikan proporsional gambar
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product['name'] ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    if (product['discountPrice'] != null)
                      Text(
                        '\$${product['price']}',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      '\$${product['discountPrice'] ?? product['price']}',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(double.infinity, 20),
                        padding: EdgeInsets.all(2),
                      ),
                      onPressed: () {},
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget MenuButton({required String title, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
