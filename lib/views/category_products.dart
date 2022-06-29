import 'package:flutter/material.dart';
import 'package:sun_tec_lb/models/product.dart';
import 'package:sun_tec_lb/repositories/product_repository.dart';
import 'package:sun_tec_lb/views/product_details.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({Key? key, required this.productCategoryId, required this.title}) : super(key: key);

  final String title;
  final String productCategoryId;

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final ProductRepository _productRepository = ProductRepository();
  late List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent.shade100,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _productRepository.getAllProducts(int.parse(widget.productCategoryId)),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot){
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(64, 75, 96, .9),
                strokeWidth: 2.0,
              ),
            );
          }
          products.isEmpty? products = snapshot.data! : null;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ProductDetails(product: products[index])));
                },
                child: Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: const Color.fromRGBO(64, 75, 96, .9), borderRadius: BorderRadius.circular(5)),
                    child: makeListTile(products[index]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  ListTile makeListTile(Product product){
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24))),
        child: Image.network(
            product.productImages.first.isEmpty ? "http://via.placeholder.com/350x150" : "https://suntec-lb.com/" + product.productImages.first
          ),

      ),
      title: Text(
        product.productName,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
    );
  }

}
